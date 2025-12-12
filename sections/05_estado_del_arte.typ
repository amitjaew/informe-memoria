= Estado del Arte
#v(.5cm)
== Modelos de Lenguaje Multimodales
#v(.5cm)
Durante los últimos años los modelos múltimodales de lenguaje han experimentado avances significativos, integrando capacidades de procesamiento de texto, imagen, audio y video. Este progreso ha sido impulsado por arquitecturas unificadas basadas en Transformers que permiten compartir un espacio de representación común entre modalidades. Avances como los _Vision-Language Encoders (VLMs)_, los _Audio-Text aligners_ y la _Tokenización Unificada_ han permitido integrar imágenes, audio y texto como secuencias compatibles. Además, técnicas como el _cross-attention multimodal_, la _late fusion optimizada_ y el _modality routing_ han mejorado la coherencia entre modalidades, habilitando tareas complejas de razonamiento y generación conjunta en múltiples formatos.

#figure(
  image("../figs/multimodal_llms.png", height: 25%),
  caption: [Multimodal LLMs]
)

#v(.2cm)
Entre los avances destacados hasta la fecha (2025) se encuentran:

- *Llama v4 Maverick (Meta)*: Modelo multimodal con descripción semántica detallada de imágenes y análisis de escenas. Pesos liberados para investigación.

- *GPT-4o (OpenAI) y Gemini 1.5 (Google)*: Modelos con integración nativa de texto, imagen y audio. Sin pesos liberados.

- *Voice-to-Voice (V2V)*: Sistemas como Whisper v3 (OpenAI) y SeamlessM4T (Meta) para transcripción y traducción en tiempo real. Voicebox (Meta) genera voz sintética con control de emociones. Whisper v3 tiene pesos liberados; SeamlessM4T y Voicebox no.



#v(.5cm)
== Modelos de Texto a Voz
#v(.5cm)
En los últimos años, arquitecturas como Tacotron 2, VITS, Kokoro TTS y modelos basados en difusión/transformers han ganado relevancia. Estos modelos, generalmente ligeros en cantidad de parámetros, son razonables de autohostear con GPUs de grado consumidor e incluso en CPU en algunos casos. Generan voces naturales con control sobre prosodia, entonación y emociones. Kokoro TTS, de código abierto, destaca por su expresividad y ajuste de voces mediante manipulación del espacio latente, evitando reentrenamiento.

#v(1cm)
#figure(
  image("../figs/tacotron_2.jpg"),
  caption: [Tacotron 2 Arquitecture]
)
#v(1cm)
Además de los modelos de código abierto, proveedores comerciales como Google Cloud, Amazon Polly, Microsoft Azure, ElevenLabs y OpenAI ofrecen soluciones TTS de alta calidad. Estas plataformas incorporan voces multilingües, opciones de personalización avanzada y capacidades de clonación vocal.

No obstante los avances observados, subsisten desafíos técnicos comunes en las alternativas investigadas, como la generación de expresividad controlable, la adaptación a entornos acústicos adversos y la síntesis eficiente de secuencias de larga duración.

#pagebreak()
== Modelos Generativos de Ambiente Sonoro

#v(.5cm)
La generación de ambientes sonoros de alta calidad sigue en fase experimental, sin soluciones comerciales consolidadas. Modelos como CLAP permiten mapear texto y audio en un espacio semántico compartido, aunque no generan audio directamente.

#v(.5cm)
Entre los modelos evaluados para la plataforma se encuentran:
- *I Hear Your True Colors*: La arquitectura propuesta en este paper combina el uso de un VQVAE, transformers y CLIP. El VQVAE extrae representaciones jerárquicas como secuencias discretas, los transformers las modelan de forma autorregresiva y CLIP alinea el audio con lo visual. Aunque el código es abierto, no existen fuentes públicas de pesos preentrenados. Sin versiones comerciales.

- *AudioLDM*: Utiliza difusión para generar espectrogramas condicionados por texto, incorporando embeddings de CLAP para mejorar la alineación semántica entre descripciones textuales y contenido sonoro. Presenta resultados prometedores en coherencia semántica y diversidad acústica. El modelo preentrenado se puede encontrar con pesos abiertos.

#figure(
  image("../figs/audioldm.png", height: 40%),
  caption: [AudioLDM]
)
#pagebreak()
