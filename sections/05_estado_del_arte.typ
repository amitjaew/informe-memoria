= Estado del Arte
#v(.5cm)

== Tecnologías y Prácticas en Accesibilidad Cultural y Artística
#v(.2cm)

La accesibilidad al arte ha sido abordada desde múltiples perspectivas, incluyendo prácticas
museográficas tradicionales, tecnologías asistivas, proyectos artísticos inclusivos y
desarrollos experimentales basados en inteligencia artificial. Su evolución reciente ha estado marcada por la incorporación de
herramientas digitales y enfoques multimodales que buscan ampliar el acceso a la
experiencia artística para personas con discapacidades sensoriales.

#v(.5cm)
=== Accesibilidad cultural tradicional y práctica museográfica
#v(.2cm)

Las instituciones culturales han implementado históricamente recursos de accesibilidad
como audiodescripciones, maquetas táctiles, textos en braille y recorridos guiados
adaptados. Estas prácticas están documentadas en guías oficiales de accesibilidad para
museos, donde se destacan las audioguías adaptadas y las signoguías como mecanismos
fundamentales para la inclusión cultural @malaga_museos_accesibilidad.

A nivel institucional, también se han desarrollado programas específicos de accesibilidad
multimedia. Un ejemplo relevante es el programa *Experiencias multimediales MAC para la
accesibilidad*, impulsado por el Museo de Arte Contemporáneo de la Universidad de Chile,
el cual incorpora audioguías, cápsulas audiovisuales subtituladas y contenidos en lengua de
señas chilena para ampliar el acceso a sus exposiciones
@mac_experiencias_multimediales.

#v(.5cm)
=== Proyectos y colectivos de accesibilidad en arte
#v(.2cm)

Existen iniciativas orientadas específicamente a la mediación artística inclusiva. El
proyecto *Audioguiarte* desarrolla audioguías personalizadas y recorridos accesibles,
combinando narrativas sonoras y contenidos adaptados para públicos diversos
@audioguiarte_proyectos.

De forma complementaria, colectivos como *MiméticasLab* exploran la recreación de obras
artísticas mediante formatos táctiles y multisensoriales, empleando tecnologías de
fabricación digital como impresión 3D para facilitar el acceso de personas con
discapacidad visual @mimeticaslab_accesible.

Un caso documentado de implementación museográfica accesible se observa en el Museo
Provincial de Bellas Artes Emilio Caraffa (Argentina), donde se desarrolló una sala accesible
para personas ciegas mediante códigos QR, audiodescripciones y paisajes sonoros,
permitiendo una experiencia estética alternativa @elpais_museo_ciegos.

#v(.5cm)
=== Investigación académica y tecnologías emergentes
#v(.5cm)

En el ámbito académico, se han propuesto sistemas que traducen representaciones visuales
a formatos multimodales accesibles. El proyecto *MAIDR* plantea la representación
multimodal de visualizaciones estadísticas mediante texto, audio y otros canales, con el
objetivo de facilitar su interpretación por parte de personas con discapacidad visual
@maidr_arxiv.

Asimismo, investigaciones recientes exploran la generación automática de música a partir
de obras pictóricas, buscando traducir atributos visuales y emocionales en experiencias
sonoras accesibles @painting_to_music_arxiv.

Estas propuestas, si bien prometedoras, se presentan mayoritariamente como prototipos
experimentales sin una integración directa en plataformas de uso cultural generalizado.

#v(.5cm)
=== Plataformas digitales de difusión cultural
#v(.2cm)

Plataformas digitales como *Smartify* y *Google Arts & Culture* han ampliado el acceso al
patrimonio artístico mediante la digitalización de colecciones y el uso de dispositivos
móviles para contextualizar obras de arte. *Smartify* permite el reconocimiento de obras
mediante imágenes y la entrega de información textual y auditiva asociada
@smartify_wikipedia.

Por su parte, *Google Arts & Culture* ofrece recorridos virtuales y colecciones digitales de
museos de todo el mundo, facilitando el acceso remoto al arte, aunque sin un foco
específico en accesibilidad profunda o personalización multimodal
@google_arts_culture.

== Comparación Cruzada de Alternativas
#v(.2cm)
// Tamaño de texto para tablas
#let tableTextSize = 9pt
#let tableHeaderSize = 9.5pt

#figure(
  [
    #table(
      columns: (25%, 30%, 20%, 25%),
      align: left,

      // Header row
      [
        #text(size: tableHeaderSize)[*Categoría*]
      ],
      [
        #text(size: tableHeaderSize)[*Ejemplos / Iniciativas*]
      ],
      [
        #text(size: tableHeaderSize)[*Modalidades*]
      ],
      [
        #text(size: tableHeaderSize)[*Limitaciones*]
      ],

      // Row 1
      [
        #text(size: tableTextSize)[Accesibilidad museográfica tradicional]
      ],
      [
        #text(size: tableTextSize)[
          - Audioguías
          - Signoguías
          - Braille]
      ],
      [
        #text(size: tableTextSize)[
          - Audio
          - Táctil
          - Texto]
      ],
      [
        #text(size: tableTextSize)[Escalabilidad limitada y alta dependencia de intervención humana]
      ],

      // Row 2
      [
        #text(size: tableTextSize)[Programas institucionales]
      ],
      [
        #text(size: tableTextSize)[Experiencias multimediales (MAC)]
      ],
      [
        #text(size: tableTextSize)[
          - Audio
          - Video
          - Lengua de señas]
      ],
      [
        #text(size: tableTextSize)[Alcance restringido a exposiciones específicas]
      ],

      // Row 3
      [
        #text(size: tableTextSize)[Proyectos inclusivos independientes]
      ],
      [
        #text(size: tableTextSize)[Audioguiarte]
      ],
      [
        #text(size: tableTextSize)[Audio narrativo]
      ],
      [
        #text(size: tableTextSize)[No universalizado ni automatizado]
      ],

      // Row 4
      [
        #text(size: tableTextSize)[Fabricación digital accesible]
      ],
      [
        #text(size: tableTextSize)[MiméticasLab]
      ],
      [
        #text(size: tableTextSize)[
          - Táctil
          - Multisensorial]
      ],
      [
        #text(size: tableTextSize)[Requiere recursos físicos y producción manual]
      ],

      // Row 5
      [
        #text(size: tableTextSize)[Investigación académica]
      ],
      [
        #text(size: tableTextSize)[MAIDR, arte a música]
      ],
      [
        #text(size: tableTextSize)[
          - Texto
          - Audio]
      ],
      [
        #text(size: tableTextSize)[Prototipos experimentales sin despliegue productivo]
      ],

      // Row 6
      [
        #text(size: tableTextSize)[Plataformas digitales generalistas]
      ],
      [
        #text(size: tableTextSize)[
          - Smartify
          - Google Arts & Culture]
      ],
      [
        #text(size: tableTextSize)[
          - Imagen
          - Texto
          - Audio]
      ],
      [
        #text(size: tableTextSize)[Baja personalización orientada a accesibilidad]
      ],
    )
  ],
  caption: [
    Comparación del Estado del Arte en Accesibilidad Artística
  ]
) <state-of-the-art-comparison>

#v(.5cm)
A pesar de los avances en tecnologías de accesibilidad artística, persiste una brecha significativa en la integración de flujos automatizados multimodales para la producción de contenido. Las soluciones actuales suelen requerir procesos manuales o semiautomáticos, donde la generación de descripciones auditivas, representaciones táctiles o traducciones sonoras se realiza de forma aislada, sin una coordinación eficiente entre modalidades. Esta fragmentación limita la escalabilidad y la coherencia en la producción de experiencias artísticas accesibles, dificultando su adopción masiva en entornos culturales.

#pagebreak()
== Modelos de Lenguaje Multimodales
#v(.5cm)
Durante los últimos años los modelos múltimodales de lenguaje han experimentado avances significativos, integrando capacidades de procesamiento de texto, imagen, audio y video. Este progreso ha sido impulsado por arquitecturas unificadas basadas en Transformers que permiten compartir un espacio de representación común entre modalidades. Avances como los _Vision-Language Encoders (VLMs)_ @visionlanguagevisionautoencoders y la _Tokenización Unificada_ @unifiedtokenizer han permitido integrar imágenes y texto como secuencias compatibles.
// Además, técnicas como el _cross-attention multimodal_, la _late fusion optimizada_ y el _modality routing_ han mejorado la coherencia entre modalidades, habilitando tareas complejas de razonamiento y generación conjunta en múltiples formatos.

#v(.5cm)
#figure(
  image("../figs/llama4_multimodal_encoding.png", height: 70%),
  caption: [Codificación Multimodal Llama V4]
) <llamav4-multimodal-encoding>

Algunos modelos destacados a la fecha son:

- *Llama v4 (Meta)* @llama4: Modelo multimodal con pesos liberados capaz de elaborar descripciones semánticas de imágenes por medio de codificación con _MetaCLIP_.
- *GPT-4o (OpenAI)* @gpt4o *y Gemini 1.5 (Google)* @gemini15: Modelos con integración nativa de texto, imagen y audio. Sin pesos liberados.

- *DeepSeek-OCR (DeepSeek)* @deepseekocr: Modelo multimodal de código abierto especializado en OCR y documentos visuales. Usa compresión óptica 2D para procesar contextos largos con alta precisión y bajo uso de tokens.

#v(.5cm)
La opción preferida para las pruebas de concepto referidas en este trabajo fue _Llama v4_ @llama4. La codificación multimodal este modelo (@llamav4-multimodal-encoding) puede entenderse como una arquitectura de fusión temprana en la que el texto, las imágenes y los fotogramas de video se convierten primero en secuencias de tokens compatibles y luego se unifican antes del procesamiento profundo con transformadores. Al alinear los tokens visuales con los tokens textuales desde la etapa de entrada, el modelo permite representaciones compartidas que facilitan la interacción entre modalidades a lo largo de todas las capas del transformer, y no solo al final. La atención contextual (o atención multimodal) opera entonces de forma bidireccional: el texto atiende a las características visuales y los tokens visuales atienden al contexto lingüístico, lo que favorece el razonamiento conjunto y el anclaje semántico. Estas características facilitan uno de nuestros principales casos de uso: la interpretación cualitativa de contenido de imagenes mediada por instrucciones de texto.

#pagebreak()
== Modelos de Texto a Voz
#v(.5cm)
En los últimos años, arquitecturas basadas en RNNs han ganado relevancia. Estos modelos, generalmente ligeros en cantidad de parámetros, son razonables de autohostear con GPUs de grado consumidor e incluso (en algunos casos) directo en CPU a coste de mayor tiempo de inferencia. Algunos aportes importantes son
- *Tacotron 2* @tacotron: Modelo de síntesis de voz basado en una arquitectura encoder–decoder con mecanismo de atención, en el cual una red recurrente genera espectrogramas mel de manera autoregresiva a partir de secuencias de texto o fonemas, utilizando posteriormente un vocoder neural para la generación de la señal de audio (@tacotronarq).
- *VITS* @vits: Modelo de síntesis de voz end-to-end que combina un encoder de texto, un modelo variacional con normalizing flows y un generador adversarial para producir directamente la forma de onda de audio, incorporando un mecanismo de alineamiento monotónico latente para modelar la correspondencia entre texto y audio.
- *StyleTTS2* @styletts2: Introduce una arquitectura de síntesis de voz multi-componente que emplea encoders separados para contenido lingüístico y estilo, junto con un generador adversarial, permitiendo modelar variaciones de prosodia y timbre a través de representaciones latentes explícitas durante el proceso de síntesis.

#v(.2cm)
#figure(
  image("../figs/tacotron_2.jpg"),
  caption: [Arquitectura de Modelo Tacotron 2]
)<tacotronarq>
#v(1cm)
Kokoro TTS @kokorotts, basado en _StyleTTS2_ @styletts2, destaca por generar voces de alta calidad con 82 millones de parametros, actualmente soporta 3 voces preentrenadas para el español.


// A pesar de los avances, persisten desafíos técnicos en los modelos evaluados, como la generación de expresividad controlable y la síntesis eficiente de secuencias largas. Esto último se puede mitigar dividiendo el texto en fragmentos (solución implementada en la librería de inferencia de Kokoro).
// En cuanto a la expresividad, VibeVoice @vibevoice surge como alternativa capaz de generar voces altamente expresivas en secuencias largas de texto, no obstante a coste de resultados ruidosos y poco consistentes.

#pagebreak()
== Modelos Generativos de Ambiente Sonoro

#v(.2cm)
La generación de ambientes sonoros de alta calidad sigue en fase experimental, sin soluciones comerciales consolidadas. Modelos como CLAP permiten mapear texto y audio en un espacio semántico compartido, aunque no generan audio directamente.

Entre los modelos inicialmente considerados para la plataforma se encuentran:
- *I Hear Your True Colors* @iheartruecolors: La arquitectura propuesta en este paper combina el uso de un VQVAE, transformers y CLIP. El VQVAE extrae representaciones jerárquicas como secuencias discretas, los transformers las modelan de forma autorregresiva y CLIP alinea el audio con lo visual. Aunque el código es abierto, no existen fuentes públicas de pesos preentrenados ni versiones comerciales por parte de proveedores externos.

// - *AudioLDM* @audioldm: Utiliza difusión para generar espectrogramas condicionados por texto, incorporando embeddings de CLAP para mejorar la alineación semántica entre descripciones textuales y contenido sonoro. Presenta resultados prometedores en coherencia semántica y diversidad acústica. El modelo preentrenado se puede encontrar con pesos abiertos.

- *AudioLDM* @audioldm: Utiliza un modelo de difusión latente para generar espectrogramas de audio condicionados por texto. El sistema emplea un autoencoder variacional (VAE) para proyectar los espectrogramas al espacio latente, donde un modelo de difusión tipo U-Net aprende el proceso generativo. La condición textual se incorpora mediante embeddings CLAP @clap, lo que mejora significativamente la alineación semántica entre descripciones textuales y el contenido sonoro generado. Tras el proceso de difusión, las representaciones latentes se decodifican nuevamente a audio (@audioldmarq). Presenta resultados prometedores en coherencia semántica y diversidad acústica. El modelo preentrenado se encuentra disponible con pesos abiertos.
#figure(
  image("../figs/audioldm.png", height: 32%),
  caption: [Arquitectura de Modelo AudioLDM]
)<audioldmarq>
#pagebreak()
