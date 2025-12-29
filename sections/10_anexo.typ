#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()
#show figure.where(kind: raw): set figure(supplement: [Código])
#codly(languages: codly-languages)

= Anexo

/*
#figure(
  [
  ```python
  def test(x: str):
      print(f"String is: {x}")
  ```],
  caption: "Some code"
) <code-sample>


Como se ve en @code-sample, podemos blablabla
*/

== Utilidades Generales
#v(.5cm)

En la prueba de concepto se emplearon modelos de lenguaje proporcionados por la plataforma _Groq_, accedidos mediante el cliente de Python de OpenAI. Este estándar es compatible con la mayoría de los proveedores de servicios de inferencia para modelos de lenguaje.

#figure(
  [
    ```python
    client = openai.OpenAI(
        base_url = "https://api.groq.com/openai/v1",
        api_key = user_secrets.get_secret("GROQ_API_KEY")
    )
    ```
  ],
  caption: "Inicialización de Cliente"
) <client-initlialization>
#v(.5cm)

Adicionalmente a lo anterior, se implementó una abstracción genérica para el procesamiento de *prompts* que contienen argumentos delimitados por llaves. Esta solución permite definir parámetros mediante notación de llaves (por ejemplo, `{clave}`) para su posterior sustitución mediante argumentos nombrados al invocar la función (ejemplo: `PARSE_PROMPT(prompt, clave=valor)`).

#figure(
  [
    ```python
    def PARSE_PROMPT(BASE_PROMPT, **kwargs):
        for key in kwargs:
            BASE_PROMPT = BASE_PROMPT.replace(
                '{' + str(key) + '}',
                str(kwargs[key])
            )
        return BASE_PROMPT

    ```
  ],
  caption: "Utilidad de Procesado de Prompts"
) <prompt-parsing>

#pagebreak()
== Pipeline de Traducción
#v(.5cm)
La pipeline de traducción implementa un flujo automatizado para convertir textos de inglés a español. Utiliza las abstracciones definidas previamente para procesar un *prompt* estructurado que especifica reglas claras de traducción, como mantener el significado original, evitar redundancias y conservar el tono del texto fuente. La función `translate` integra este *prompt* con el texto de entrada mediante la utilidad de parsing de argumentos, enviando la solicitud al modelo y retornando la traducción generada de manera directa y sin modificaciones adicionales.

#figure(
  [
  ```python
  TRANSLATOR_PROMPT = \
  """Traduce el siguiente texto al español de manera directa y clara.
  Considera lo siguiente:
  - Mantén el significado exacto del texto original.
  - NO agregues explicaciones, comentarios o interpretaciones.
  - NO seas redundante.
  - Conserva el estilo y tono original del texto.
  - Escribe solo la traducción, sin títulos ni subtítulos.

  Texto original: {TEXT}
  Traducción:"""

  def translate(text):
      completion = client.chat.completions.create(
          model="openai/gpt-oss-120b",
          messages=[{
              "role": "user",
              "content": [{
                  "type": "text",
                  "text": PARSE_PROMPT(TRANSLATOR_PROMPT, TEXT=text)
              }]
          }],
          temperature=0,
          max_completion_tokens=1024,
          top_p=1,
          stream=False,
          stop=None,
      )
      content = completion.choices[0].message.content
      return content
  ```],
  caption: "Script de Traducción"
) <traduction-script>

== Pipeline de Extracción de Fuentes
#v(.5cm)

Para extraer información procesada de fuentes autoritativas se procedió con el desarrollo de utilidades para extraer datos desde una URL y procesarlo en forma de bulletpoint para presentar los resultados de manera estructurada y clara en forma de viñetass.
#figure(
  [
    ```python
    def extract_text_from_url(url: str) -> str:
        headers = {
            "User-Agent": "Mozilla/5.0 (X11; Linux x86_64; rv:140.0) Gecko/20100101 Firefox/140.0",
        }
        response = requests.get(url, headers=headers).raise_for_status()
        soup = BeautifulSoup(response.text, 'html.parser')

        for tag in soup(['script', 'style']):
            tag.decompose()

        paragraphs = [p.get_text(strip=True) for p in soup.find_all('p')]
        return '\n\n'.join(paragraphs)
    ```
  ],
  caption: "Scraper Extractor de Información"
) <information-extraction-scraper>

#figure(
  [
    ```python
    SOURCE_EXTRACTOR_PROMPT = """Eres un extractor de información precisa y concisa. Tu tarea es leer el texto de un artículo y devolver una lista de viñetas (•) con todos los hechos y datos relevantes, escritos en español natural y claro.

    Instrucciones:
    1. Identifica los hechos principales, cifras, declaraciones, fechas, nombres y conclusiones clave del texto.
    2. No incluyas opiniones, lenguaje publicitario o frases irrelevantes.
    3. Si el texto está en inglés u otro idioma, traduce los puntos al español correctamente.
    4. Usa frases breves pero completas, cada una iniciando con un punto (•).
    5. Mantén el tono informativo y objetivo.

    Texto del artículo: {TEXT}
    Tu respuesta:"""
    ```
  ],
  caption: "Prompt de Extracción de Información"
) <information-extraction-prompt>

#figure(
  [
    ```python
    def extract_url_context(url):
        text = extract_text_from_url(url)[:8_000]

        completion = client.chat.completions.create(
            model="openai/gpt-oss-120b",
            messages=[{
                "role": "user",
                "content": [{
                    "type": "text",
                    "text": PARSE_PROMPT(SOURCE_EXTRACTOR_PROMPT, TEXT=text)
                }]
            }],
            temperature=0,
            max_completion_tokens=2048,
            top_p=1,
            stream=False,
            stop=None,
        )
        content = completion.choices[0].message.content
        return content
    ```
  ],
  caption: "Script de Extracción de Información"
) <information-extraction-script>

#v(2cm)
== Generación de Contenido General
#v(.5cm)
Para los metadatos generales de la plataforma, aunque no visibles en el *frontend* de la prueba de concepto, se pobló la base de datos con períodos, técnicas pictóricas y breves biografías de los autores. Estos metadatos, aunque no visibles en el *frontend* de la prueba de concepto, proporcionan información contextual esencial para la interpretación y categorización de las obras de arte que en una etapa posterior del proyecto podrían enriquecer la experiencia del usuario.

Pasa la generación de estos se usaron dos enfoques distintos. Para técnicas pictóricas y períodos artísticos, se empleó generación directa con modelos de lenguaje. En cambio, para biografías de autores se extrajo información de Wikipedia para evitar imprecisiones en datos biográficos complejos, priorizando la calidad de la fuente.

#figure(
  [
    ```python
    TECHNIQUE_PROMPT = \
    """Explícame en detalle una técnica de pintura o dibujo.
    Considera lo siguiente:
    - Debe estar en un formato adecuado para narración.
    - Debe ser conciso y corto en duración.
    - NO digas en resumen.
    - NO seas redundante.
    - NO utilices títulos ni subtitulos, solo escribe en parrafos narrados.

    Técnica: {TECHNIQUE}
    Explicación:"""

    def get_technique(technique):
        completion = client.chat.completions.create(
            #model="llama-3.1-8b-instant",
            model="llama-3.3-70b-versatile",
            messages=[{
                "role": "user",
                "content": [{
                    "type": "text",
                    "text": PARSE_PROMPT(TECHNIQUE_PROMPT, TECHNIQUE=technique)
                }]
            }],
            temperature=0,
            max_completion_tokens=1024,
            top_p=1,
            stream=False,
            stop=None,
        )
        content = completion.choices[0].message.content
        return content
    ```
  ],
  caption: "Generador de Texto de Técnica"
) <technique-generator>

#v(1cm)
Como se ha detallado previamente, la generación de este contenido requiere únicamente el nombre de la técnica o estilo pictórico a describir. Además, se han implementado consideraciones específicas en cuanto a la cadencia y el estilo del texto generado, con el objetivo de optimizar su procesamiento mediante modelos de síntesis de voz (TTS).

#figure(
  [
    ```python
    PERIOD_PROMPT = \
    """Explícame en detalle un estilo pictórico en particular.
    Considera lo siguiente:
    - Debe estar en un formato adecuado para narración.
    - Debe ser conciso y corto en duración.
    - NO digas en resumen.
    - NO seas redundante.
    - NO utilices títulos ni subtitulos, solo escribe en parrafos narrados.

    Estilo pictórico: {PERIOD}
    Explicación:"""

    def get_period(period):
        completion = client.chat.completions.create(
            #model="llama-3.1-8b-instant",
            model="llama-3.3-70b-versatile",
            messages=[{
                "role": "user",
                "content": [{
                    "type": "text",
                    "text": PARSE_PROMPT(PERIOD_PROMPT, PERIOD=period)
                }]
            }],
            temperature=0,
            max_completion_tokens=1024,
            top_p=1,
            stream=False,
            stop=None,
        )
        return completion.choices[0].message.content
    ```
  ],
  caption: "Generador de Texto de Período"
) <period-text-generator>

#pagebreak()

En la generación de la biografía utilizó el script de extracción de información (@information-extraction-script) para procesar un breve texto narrado de la vida del autor, tomando datos de Wikipedia.
#v(.5cm)
#figure(
  [
    ```python
    AUTHOR_BIO_PROMPT = \
    """Eres un experto en redacción biográfica y narrativa.
    Tu tarea es leer el siguiente texto y redactar una biografía breve y fluida del autor o artista mencionado, adecuada para acompañar una ficha de obra de arte.
    Instrucciones:
    1. Resume los aspectos esenciales de la vida y obra del autor: formación, estilo, periodo histórico, aportes y relevancia artística.
    2. Mantén un tono natural, informativo y narrativo, sin usar listas ni formato enciclopédico.
    3. Evita redundancias, tecnicismos innecesarios y frases genéricas.
    4. No incluyas fechas o datos no presentes en el texto fuente.
    5. No menciones el proceso de redacción ni expresiones como “esta biografía trata sobre”.
    6. Si el texto está en otro idioma, tradúcelo al español de manera natural.
    7. Extensión máxima: dos párrafos.
    8. Evita completamente el uso de caracteres especiales

    Texto: {TEXT}
    Tu respuesta:"""

    def get_bio(url):
        text = extract_url_context(url)
        completion = client.chat.completions.create(
            model="llama-3.3-70b-versatile",
            messages=[{
                "role": "user",
                "content": [{
                    "type": "text",
                    "text": PARSE_PROMPT(AUTHOR_BIO_PROMPT, TEXT=text)
                }]
            }],
            temperature=0,
        )
        return completion.choices[0].message.content
    ```,
  ],
  caption: "Author Bio Generation"
) <author-bio-generator>

== Utilidades Generales de Procesamiento de Imágenes
#v(.5cm)
A continuación se definen utilidades de procesamiento de imágenes para el preprocesamiento básico antes de realizar llamadas a proveedores de servicios de inferencia o su uso en modelos autohospedados.
- *`resize_if_oversized`* ajusta imágenes manteniendo proporciones, evitando que excedan un tamaño máximo para optimizar almacenamiento y rendimiento.
- *`download_img`* descarga imágenes desde URLs usando un *user-agent* personalizado (para evitar bloqueos de conexión) y las redimensiona si superan el límite, garantizando su adaptación al sistema.
- *`image_to_base64`* convierte imágenes PIL a base64, facilitando su transmisión y almacenamiento como texto plano para integración en APIs o bases de datos.

#figure(
  [
    ```python
    def resize_if_oversized(image, max_dim=1024):
        width, height = image.size
        if max(width, height) <= max_dim:
            return image  # nothing to do

        # scale preserving proportions
        scale = max_dim / max(width, height)
        new_size = (int(width * scale), int(height * scale))
        return image.resize(new_size, Image.Resampling.LANCZOS)

    def download_img(url, max_dim: int = 1024):
        headers = { "User-Agent": "Chrome/51.0.2704.103 Safari/537.36" }
        r = requests.get(url, headers=headers)
        im = Image.open(BytesIO(r.content))
        im = resize_if_oversized(im, max_dim)
        return im

    def image_to_base64(image: Image.Image, format="PNG") -> str:
        """Convert PIL Image to base64 string."""
        buffered = BytesIO()
        image.save(buffered, format=format)
        return base64.b64encode(buffered.getvalue()).decode("utf-8")
    ```
  ],
  caption: "Utilidades de Procesamiento de Imágenes"
) <image-parsing-utilities>

== Narrador de Contexto
#v(.3cm)
Este modulo toma como entrada una _URL_ de un articulo de Wikipedia para generar una narración didáctica sobre el contexto en que una obra se produjo.

Utiliza el módulo descrito en @information-extraction-script para la extracción de la información.

#figure(
  [
    ```python
    SOURCE_SUMMARY_PROMPT = \
    """Eres un experto en redacción narrativa. Tu tarea es leer el siguiente texto y escribir un resumen breve (máximo dos párrafos) en un estilo natural, fluido y adecuado para narración oral o escrita.

    Instrucciones:
    1. Mantén un tono narrativo, como si estuvieras contando los hechos de manera clara y atractiva.
    2. Sé conciso: evita repeticiones, rodeos o frases innecesarias.
    3. No incluyas títulos, subtítulos ni listas.
    4. No uses expresiones como “en resumen”, “este artículo trata sobre”, ni menciones al proceso de resumen.
    5. Si el texto está en otro idioma, tradúcelo al español con naturalidad.
    6. Enfócate en los hechos principales y el contexto historico de la producción de la obra.

    Texto: {TEXT}
    Tu respuesta:"""

    def get_narration(url):
        text = extract_url_context(url)
        completion = client.chat.completions.create(
            model="llama-3.3-70b-versatile",
            messages=[{
                "role": "user",
                "content": [{
                    "type": "text",
                    "text": PARSE_PROMPT(SOURCE_SUMMARY_PROMPT, TEXT=text)
                }]
            }],
            temperature=0,
        )
        return completion.choices[0].message.content
    ```
  ],
  caption: "Generación de texto para narraciones"
) <context-narration-script>



== Generación de Audio Descriptivo
#v(.5cm)
Este modulo toma como entrada una _URL_ a una imagen, para luego procesarla en una descripción objetiva de los elementos representados.

Para el procesamiento de las imagenes se utilizan las utilidades definidas en @image-parsing-utilities.
Para la generación del texto se emplea un *prompt* estructurado que guía al modelo en la creación de descripciones literales del contenido de la obra con cadencia de narración oral.

#figure(
  [
    ```python
    DESCRIPTION_PROMPT = \
    """Describe los elementos retratados en la imagen.
    Considera lo siguiente:
    - Debe estar en un formato adecuado para narración.
    - Debe ser conciso y corto en duración.
    - NO digas en resumen.
    - NO seas redundante.
    - NO utilices títulos ni subtitulos, solo escribe en parrafos narrados.

    Elementos retratados: """

    def get_description(url):
        image = download_img(url)
        b64_image = image_to_base64(image)
        completion = client.chat.completions.create(
            model="meta-llama/llama-4-scout-17b-16e-instruct",
            messages=[{
                "role": "user",
                "content": [
                    { "type": "text",
                      "text": DESCRIPTION_PROMPT },
                    { "type": "image_url",
                      "image_url": {
                        "url": f"data:image/png;base64,{b64_image}"
                      } }
                ]
            }],
            temperature=0,
        )
        return completion.choices[0].message.content
    ```
  ],
  caption: "Generación de texto para audios dscriptivos"
) <descriptive-audio-gen>

#pagebreak()
== Generación de Sonidos Ambientales
#v(.5cm)
La euristica utilizada para la generación de sonidos ambientales consiste en 3 pasos:

1. *Segmentación de la imagen* (@image-quadrant-cropping): La obra se divide en cuadrantes mediante un algoritmo de particionamiento espacial. Cada cuadrante se utiliza posteriormente como entrada para los pasos posteriores.

2. *Extracción semántica de elementos* (@sound-ambient-element-extraction): Mediante Llama 4 Scout 17B se analizan cada cuadrante para detectar objetos, seres vivos y elementos con potencial sonoro. La salida en JSON incluye descripción y clasificación (fondo/primer plano) de los elementos detectados.

3. *Síntesis de audio ambiental* (@sound-ambient-generation): Utilizando modelos generativos de audio basados en difusión (AudioLDM), se produce una composición sonora multicanal que integra los elementos detectados. Cada componente sonoro se ajusta en términos de volumen y posición espacial relativa según su ubicación en la cuadrícula original, creando una experiencia auditiva coherente con la distribución visual de la obra.

#v(.5cm)
#figure(
  [
    ```python
    def get_quadrants(image: Image, N:int=3):
        total_width, total_height = image.size
        w, h = total_width//N, total_height//N
        w_pos = [(w*i, w*(i+1)) for i in range(N)]
        h_pos = [(h*i, h*(i+1)) for i in range(N)]
        boxes = [
            (w_pos[i][0], h_pos[j][0], w_pos[i][1], h_pos[j][1])
            for j in range(N) for i in range(N)
        ]
        cropped = [ image.crop(box)
                    for box in boxes ]
        coords= [
          ( (i/N + (i+1)/N)/2,
            (j/N + (j+1)/N)/2 )
          for j in range(N) for i in range(N)
        ]

        return cropped, coords
    ```
  ],
  caption: "Segmentación de imagen en cuadrantes"
) <image-quadrant-cropping>

#figure(
  [
    ```python
    EXTRACTOR_PROMPT = \
    """Extract audio ambience generation keys from the following image.

    Consider the following:
    - Your output should be a list of json objects containing the keys:
        {"is_background": bool, "object": string}
    - Only indicate objects with sound ambience relevance.
    - Ignore abstract elements
    - Indicate 3 elements at most
    - Group elements when there are more than 1 depicted
    - You should only output ONE list
    - Alive elements should be added with their corresponding sound description (bear growling, dog barking)
    - Non alive elements should be specified as the element itself
    - Output just the required JSON results

    JSON RESULT:"""

    def get_semantic_elements(image: Image, max_attempts=3):
        b64_image = image_to_base64(image)
        for _ in range(max_attempts):
            try:
                completion = client.chat.completions.create(
                    model="meta-llama/llama-4-scout-17b-16e-instruct",
                    messages=[{
                    "role": "user",
                    "content": [
                    { "type": "text",
                        "text": EXTRACTOR_PROMPT },
                    { "type": "image_url",
                        "image_url": {
                        "url": f"data:image/png;base64,{b64_image}" } }
                    ]
                    }],
                    temperature=0,
                )
                content = completion.choices[0].message.content
                return json.loads(content)
            except:
                continue
        return []
    ```
  ],
  caption: "Extracción semántica de elementos en la obra"
) <sound-ambient-element-extraction>

#figure(
  [
    ```python
    from diffusers import AudioLDMPipeline
    from pydub import AudioSegment
    import numpy as np
    import tempfile
    import os
    import torch
    VOLUME_DB_BACKGROUND = -20
    VOLUME_DB_FOREGROUND = -5

    pipe = AudioLDMPipeline.from_pretrained(
        "cvssp/audioldm"
        torch_dtype=torch.float16
    ).to("cuda")

    def tensor_to_audiosegment(audio_tensor, sample_rate=16000):
        samples = (audio_tensor * 32767).astype(np.int16)
        return AudioSegment(
            samples.tobytes(),
            frame_rate=sample_rate,
            sample_width=2,  # 16-bit = 2 bytes
            channels=1
        )

    def generate_ambient_sound(scene, filename):
        final_mix = AudioSegment.silent(duration=20000)
        for i, obj in enumerate(scene):
            prompt = obj['object']
            negative_prompt = ["low quality, average quality"]
            result = pipe(
                [prompt],
                negative_prompt=negative_prompt,
                num_inference_steps=30,
                audio_length_in_s=20,
                return_dict=True
            )
            audio_tensor = result.audios[0].squeeze()
            audio_segment = tensor_to_audiosegment(audio_tensor)
            volume_db = VOLUME_DB_BACKGROUND if obj["is_background"] else VOLUME_DB_FOREGROUND
            audio_segment = audio_segment + volume_db
            final_mix = final_mix.overlay(audio_segment)

        final_mix.export(f"{filename}.wav", format="wav")
    ```
  ],
  caption: "Generación de sonido ambiental con AudioLDM"
) <sound-ambient-generation>

== Text to Speech
#v(.5cm)
Para el módulo de *Text-to-Speech* (TTS) uno de los modelos que se utilizó fué *Kokoro*, para el cual existe una biblioteca en Python con módulos de inferencia preimplementados.

#figure(
  [
    ```python
    # !pip install -q kokoro>=0.9.4 soundfile
    # !apt-get -qq -y install espeak-ng > /dev/null 2>&1

    from kokoro import KPipeline
    from IPython.display import display, Audio
    import soundfile as sf
    import torch

    tts_pipeline = KPipeline(lang_code='e')
    ```
  ],
  caption: "Setup Kokoro TTS"
) <kokoro-tts-setup>

#v(.5cm)
Nuestro módulo de generación de TTS considera detalles como el añadido de silencios entre saltos de línea y pausas para mantener una cadencia fluida en la narración y la concatenación de las secciones generadas por _Kokoro_.

#figure(
  [
    ```python
    def tts(text, filename):
        generator = tts_pipeline(
            text,
            voice='em_santa',
            speed=1, split_pattern=r'\n+'
        )

        pause_duration = 0.5
        silence = np.zeros(int(24000 * pause_duration), dtype=np.float32)
        all_audio = []

        for i, (gs, ps, audio) in enumerate(generator):
            all_audio.append(audio)
            all_audio.append(silence)

        final_audio = np.concatenate(all_audio)
        sf.write(f"{filename}.wav", final_audio, 24000)
    ```
  ],
  caption: "Generación de audio con Kokoro TTS"
) <kokoro-tts-generation>
