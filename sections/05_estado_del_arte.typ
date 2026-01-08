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
#v(.5cm)
== Modelos de Lenguaje Multimodales
#v(.5cm)
Durante los últimos años los modelos múltimodales de lenguaje han experimentado avances significativos, integrando capacidades de procesamiento de texto, imagen, audio y video. Este progreso ha sido impulsado por arquitecturas unificadas basadas en Transformers que permiten compartir un espacio de representación común entre modalidades. Avances como los _Vision-Language Encoders (VLMs)_, los _Audio-Text aligners_ y la _Tokenización Unificada_ han permitido integrar imágenes, audio y texto como secuencias compatibles. Además, técnicas como el _cross-attention multimodal_, la _late fusion optimizada_ y el _modality routing_ han mejorado la coherencia entre modalidades, habilitando tareas complejas de razonamiento y generación conjunta en múltiples formatos.

#figure(
  image("../figs/multimodal_llms.png", height: 25%),
  caption: [Multimodal LLMs]
)

#v(.7cm)
Algunos modelos destacados a la fecha son:

- *Llama v4 Maverick (Meta)*: Modelo multimodal con pesos liberados capaz de elaborar descripciones semánticas de imágenes por medio de codificación con _MetaCLIP_ @llama4.

- *GPT-4o (OpenAI) y Gemini 1.5 (Google)*: Modelos con integración nativa de texto, imagen y audio. Sin pesos liberados.

- *DeepSeek-OCR (DeepSeek)*: Modelo multimodal de código abierto especializado en OCR y documentos visuales. Usa compresión óptica 2D para procesar contextos largos con alta precisión y bajo uso de tokens @deepseekocr.

#pagebreak()
== Modelos de Texto a Voz
#v(.5cm)
En los últimos años, arquitecturas basadas en RNNs como _Tacotron 2_ @tacotron, _VITS_ @vits y _StyleTTS2_ @styletts2 han ganado relevancia. Estos modelos, generalmente ligeros en cantidad de parámetros, son razonables de autohostear con GPUs de grado consumidor e incluso (en algunos casos) directo en CPU a coste de mayor tiempo de inferencia. Generan voces con entonación natural aunque con expresividad limitada. Kokoro TTS @kokorotts, basado en @styletts2, destaca por generar voces de alta calidad con 82 millones de parametros, actualmente soporta 3 voces preentrenadas para el español.//, siendo posible interpolarlas vectorialmente.

#v(1cm)
#figure(
  image("../figs/tacotron_2.jpg"),
  caption: [Tacotron 2 Arquitecture]
)
#v(1cm)
Además de los modelos de código abierto, proveedores comerciales como Google Cloud, Amazon Polly, Microsoft Azure, ElevenLabs y OpenAI ofrecen soluciones TTS de alta calidad. Estas plataformas incorporan voces multilingües, opciones de personalización avanzada y capacidades de clonación vocal.

A pesar de los avances, persisten desafíos técnicos en los modelos evaluados, como la generación de expresividad controlable y la síntesis eficiente de secuencias largas. Esto último se puede mitigar dividiendo el texto en fragmentos (solución implementada en la librería de inferencia de Kokoro).
En cuanto a la expresividad, VibeVoice @vibevoice surge como alternativa capaz de generar voces altamente expresivas en secuencias largas de texto, no obstante a coste de resultados ruidosos y poco consistentes.

#pagebreak()
== Modelos Generativos de Ambiente Sonoro

#v(.5cm)
La generación de ambientes sonoros de alta calidad sigue en fase experimental, sin soluciones comerciales consolidadas. Modelos como CLAP permiten mapear texto y audio en un espacio semántico compartido, aunque no generan audio directamente.

#v(.5cm)
Entre los modelos inicialmente considerados para la plataforma se encuentran:
- *I Hear Your True Colors* @iheartruecolors: La arquitectura propuesta en este paper combina el uso de un VQVAE, transformers y CLIP. El VQVAE extrae representaciones jerárquicas como secuencias discretas, los transformers las modelan de forma autorregresiva y CLIP alinea el audio con lo visual. Aunque el código es abierto, no existen fuentes públicas de pesos preentrenados. Sin versiones comerciales.

- *AudioLDM* @audioldm: Utiliza difusión para generar espectrogramas condicionados por texto, incorporando embeddings de CLAP para mejorar la alineación semántica entre descripciones textuales y contenido sonoro. Presenta resultados prometedores en coherencia semántica y diversidad acústica. El modelo preentrenado se puede encontrar con pesos abiertos.

#figure(
  image("../figs/audioldm.png", height: 40%),
  caption: [AudioLDM]
)
#pagebreak()
