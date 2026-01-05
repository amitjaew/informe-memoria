= Estado del Arte
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
Entre los modelos evaluados para la plataforma se encuentran:
- *I Hear Your True Colors* @iheartruecolors: La arquitectura propuesta en este paper combina el uso de un VQVAE, transformers y CLIP. El VQVAE extrae representaciones jerárquicas como secuencias discretas, los transformers las modelan de forma autorregresiva y CLIP alinea el audio con lo visual. Aunque el código es abierto, no existen fuentes públicas de pesos preentrenados. Sin versiones comerciales.

- *AudioLDM* @audioldm: Utiliza difusión para generar espectrogramas condicionados por texto, incorporando embeddings de CLAP para mejorar la alineación semántica entre descripciones textuales y contenido sonoro. Presenta resultados prometedores en coherencia semántica y diversidad acústica. El modelo preentrenado se puede encontrar con pesos abiertos.

#figure(
  image("../figs/audioldm.png", height: 40%),
  caption: [AudioLDM]
)
#pagebreak()
