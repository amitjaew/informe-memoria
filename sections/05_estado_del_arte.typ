#import "@preview/marginalia:0.3.1" as marginalia: note, notefigure, wideblock

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
museos @malaga_museos_accesibilidad, donde se destacan las audioguías adaptadas y las signoguías como mecanismos
fundamentales para la inclusión cultural.

A nivel institucional, también se han desarrollado programas específicos de accesibilidad
multimedia. Un ejemplo relevante es el programa *Experiencias multimediales MAC para la
accesibilidad* @mac_experiencias_multimediales, impulsado por el Museo de Arte Contemporáneo de la Universidad de Chile,
el cual incorpora audioguías, cápsulas audiovisuales subtituladas y contenidos en lengua de
señas chilena para ampliar el acceso a sus exposiciones.

#v(.5cm)
=== Proyectos y colectivos de accesibilidad en arte
#v(.2cm)

Existen iniciativas orientadas específicamente a la mediación artística inclusiva. El
proyecto *Audioguiarte* @audioguiarte_proyectos desarrolla audioguías personalizadas y recorridos accesibles,
combinando narrativas sonoras y contenidos adaptados para públicos diversos.

De forma complementaria, colectivos como *MiméticasLab* @mimeticaslab_accesible exploran la recreación de obras
artísticas mediante formatos táctiles y multisensoriales, empleando tecnologías de
fabricación digital como impresión 3D para facilitar el acceso de personas con
discapacidad visual.

Un caso documentado de implementación museográfica accesible se observa en el Museo
Provincial de Bellas Artes Emilio Caraffa (Argentina) @elpais_museo_ciegos, donde se desarrolló una sala accesible
para personas ciegas mediante códigos QR, audiodescripciones y paisajes sonoros,
permitiendo una experiencia estética alternativa.

#v(.5cm)
=== Investigación académica y tecnologías emergentes
#v(.5cm)

En el ámbito académico, se han propuesto sistemas que traducen representaciones visuales
a formatos multimodales accesibles. El proyecto *MAIDR* @maidr_arxiv plantea la representación
multimodal de visualizaciones estadísticas mediante texto, audio y otros canales, con el
objetivo de facilitar su interpretación por parte de personas con discapacidad visual.

Asimismo, investigaciones recientes @painting_to_music_arxiv exploran la generación automática de música a partir
de obras pictóricas, buscando traducir atributos visuales y emocionales en experiencias
sonoras accesibles.

Estas propuestas, si bien prometedoras, se presentan mayoritariamente como prototipos
experimentales sin una integración directa en plataformas de uso cultural generalizado.

#v(.5cm)
=== Plataformas digitales de difusión cultural
#v(.2cm)

Plataformas digitales como *Smartify* y *Google Arts & Culture* han ampliado el acceso al
patrimonio artístico mediante la digitalización de colecciones y el uso de dispositivos
móviles para contextualizar obras de arte. *Smartify* @smartify_wikipedia permite el reconocimiento de obras
mediante imágenes y la entrega de información textual y auditiva asociada.

Por su parte, *Google Arts & Culture* @google_arts_culture ofrece recorridos virtuales y colecciones digitales de
museos de todo el mundo, facilitando el acceso remoto al arte, aunque sin un foco
específico en accesibilidad profunda o personalización multimodal.

#pagebreak()

== Comparación Cruzada de Alternativas
#v(.2cm)
En @state-of-the-art-comparison se sintetiza las principales categorías de soluciones revisadas, comparando sus iniciativas representativas, las modalidades que emplean y sus limitaciones.

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

Algunos modelos destacados a la fecha son:

- *Llama v4 (Meta)* @llama4: Modelo multimodal con pesos liberados capaz de elaborar descripciones semánticas de imágenes por medio de codificación con _MetaCLIP_.
- *GPT-4o (OpenAI)* @gpt4o *y Gemini 1.5 (Google)* @gemini15: Modelos con integración nativa de texto, imagen y audio. Sin pesos liberados.

- *DeepSeek-OCR (DeepSeek)* @deepseekocr: Modelo multimodal de código abierto especializado en OCR y documentos visuales. Usa compresión óptica 2D para procesar contextos largos con alta precisión y bajo uso de tokens.

#v(.5cm)
_Llama v4_ @llama4 fue seleccionado para las pruebas de concepto de este trabajo, debido a la combinación de tres factores: disponibilidad de pesos abiertos, soporte nativo para codificación de imágenes mediante MetaCLIP, y acceso a través de proveedores de inferencia en la nube a coste reducido —ventajas que los modelos privativos como GPT-4o o Gemini 1.5 no ofrecen simultáneamente.

#align(center, block(width: 100% + 2cm)[
  #figure(
    image("../figs/llama4_multimodal_encoding.png", width: 125%),
    caption: [Codificación Multimodal Llama V4]
  ) <llamav4-multimodal-encoding>
])

En @llamav4-multimodal-encoding se demuestra la funcionalidad de la *codificación multimodal con fusión temprana* de _Llama v4_ @llama4, esta se puede apreciar en un esquema vertical que comprende:
#v(.5cm)

- *Parte superior (etapa de entrada).* Se evaluan tres tipos de entradas: *Text Input*, *Image Input* y *Video Input (frames)*. El texto desciende hacia un *Text Tokenizer*, que lo transforma en una *Text Token Sequence*. En paralelo, las imágenes y los fotogramas de video pasan por un *Vision Encoder* basado en un modelo de visión (alineado con Llama), que genera una *Visual Token Sequence*. Estas representaciones visuales se convierten en secuencias de tokens que pueden integrarse con los tokens de texto, permitiendo un espacio de representación común antes del procesamiento conjunto.

#v(.2cm)
- *Zona media (fusión temprana).* Más abajo, ambas secuencias (la textual a la izquierda y la visual a la derecha) confluyen en el bloque central denominado *Early Fusion Layer*. Esta capa produce una *Unified Token Sequence*. En paralelo, la unificación ocurre antes de cualquier procesamiento profundo: las distintas modalidades se concatenan y se procesan conjuntamente desde los primeros bloques del modelo.

#v(.2cm)
- *Sección inferior (procesamiento profundo y output).* La secuencia unificada alimenta las *Transformer Layers (with iRoPE Architecture)*. Estas capas operan de forma conjunta sobre todos los tokens y aplican el proceso de *Cross-Modal Attention*, donde se explicitan dos direcciones complementarias: *Text-to-Image Attention* e *Image-to-Text Attention*. Ambas interacciones confluyen en un nivel de *Joint Contextual Understanding*, representando la construcción de una comprensión contextual compartida entre modalidades. Finalmente, de los mecanismos de atención del transformer se obtiene la salida final del modelo en modalidad de predicción de tokens.


// La @llamav4-multimodal-encoding ilustra la arquitectura de codificación multimodal de este modelo. En la etapa de entrada (izquierda del diagrama), el texto, las imágenes y los fotogramas de video son convertidos de forma independiente en secuencias de tokens compatibles: los tokens de imagen son generados por MetaCLIP, mientras que el texto se tokeniza de forma estándar. Estas secuencias son luego unificadas y procesadas por el bloque de transformadores (centro), donde la atención opera de forma bidireccional: los tokens de texto atienden a las características visuales y los tokens visuales atienden al contexto lingüístico. Este alineamiento temprano —en contraste con arquitecturas de fusión tardía— permite que las representaciones compartidas atraviesen todas las capas del transformer, favoreciendo el razonamiento conjunto y el anclaje semántico. El resultado es la capacidad de generar respuestas textuales profundamente informadas por el contenido visual (derecha del diagrama), caso de uso central en este trabajo para la interpretación de obras artísticas.

#pagebreak()
== Modelos de Texto a Voz
#v(.5cm)
En los últimos años, arquitecturas basadas en RNNs han ganado relevancia. Estos modelos, generalmente ligeros en cantidad de parámetros, son razonables de autohostear con GPUs de grado consumidor e incluso (en algunos casos) directo en CPU a coste de mayor tiempo de inferencia. Algunos aportes importantes son
- *Tacotron 2* @tacotron: Modelo de síntesis de voz basado en una arquitectura encoder–decoder con mecanismo de atención, en el cual una red recurrente genera espectrogramas mel de manera autoregresiva a partir de secuencias de texto o fonemas, utilizando posteriormente un vocoder neural para la generación de la señal de audio (@tacotronarq).
- *VITS* @vits: Modelo de síntesis de voz end-to-end que combina un encoder de texto, un modelo variacional con normalizing flows y un generador adversarial para producir directamente la forma de onda de audio, incorporando un mecanismo de alineamiento monotónico latente para modelar la correspondencia entre texto y audio.
- *StyleTTS2* @styletts2: Introduce una arquitectura de síntesis de voz multi-componente que emplea encoders separados para contenido lingüístico y estilo, junto con un generador adversarial, permitiendo modelar variaciones de prosodia y timbre a través de representaciones latentes explícitas durante el proceso de síntesis.

#v(.2cm)
#align(center, block(width: 100% + 2cm)[
  #figure(
    image("../figs/tacotron_2.jpg"),
    caption: [Arquitectura de Modelo Tacotron 2]
  )<tacotronarq>
])

#v(.2cm)
Kokoro TTS @kokorotts, basado en _StyleTTS2_ @styletts2, destaca por generar voces de alta calidad con 82 millones de parametros, actualmente soporta 3 voces preentrenadas para el español.

== Modelos Generativos de Ambiente Sonoro

#v(.2cm)
La generación de ambientes sonoros de alta calidad sigue en fase experimental, sin soluciones comerciales consolidadas. Modelos como CLAP permiten mapear texto y audio en un espacio semántico compartido, aunque no generan audio directamente.

Entre los modelos inicialmente considerados para la plataforma se encuentran:
- *I Hear Your True Colors* @iheartruecolors: La arquitectura propuesta en este paper combina el uso de un VQVAE, transformers y CLIP. El VQVAE extrae representaciones jerárquicas como secuencias discretas, los transformers las modelan de forma autorregresiva y CLIP alinea el audio con lo visual. Aunque el código es abierto, no existen fuentes públicas de pesos preentrenados ni versiones comerciales por parte de proveedores externos.

- *AudioLDM* @audioldm: Utiliza un modelo de difusión latente para generar espectrogramas de audio condicionados por texto. El sistema emplea un autoencoder variacional (VAE) para proyectar los espectrogramas al espacio latente, donde un modelo de difusión tipo U-Net aprende el proceso generativo. La condición textual se incorpora mediante embeddings CLAP @clap, lo que mejora significativamente la alineación semántica entre descripciones textuales y el contenido sonoro generado. Tras el proceso de difusión, las representaciones latentes se decodifican nuevamente a audio (@audioldmarq). Presenta resultados prometedores en coherencia semántica y diversidad acústica. El modelo preentrenado se encuentra disponible con pesos abiertos.
#figure(
  image("../figs/audioldm.png", height: 32%),
  caption: [Arquitectura de Modelo AudioLDM]
)<audioldmarq>

#v(1.5cm)
