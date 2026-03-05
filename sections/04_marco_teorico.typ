= Marco Teórico

#v(.5cm)
== Modelos de Lenguaje Multimodales
#v(.2cm)
Los modelos de lenguaje (LLMs, por sus siglas en inglés) representan sistemas computacionales diseñados para procesar, comprender y generar texto en lenguaje natural mediante arquitecturas basadas en aprendizaje profundo. Estos modelos, entrenados en vastos corpus textuales, capturan patrones lingüísticos, semánticos y contextuales, permitiendo tareas como la traducción automática, la generación de respuestas coherentes o el análisis de sentimientos. Su evolución ha dado paso a los modelos de lenguaje multimodales, los cuales extienden estas capacidades al integrar contenido multimedial como imágenes y audio.

Estos nos permiten generar descripciones detalladas de escenas, objetos o composiciones artísticas, traduciendo elementos visuales en narrativas estructuradas. Además, su capacidad multimodal se puede utilizar para procesar entradas de voz y participar en flujos conversacionales voz a voz, facilitando interacciones más naturales y accesibles. Esta convergencia de modalidades (texto, imagen y sonido) facilita la creación de sistemas más ricos y adaptables, capaces de ofrecer interpretaciones contextualizadas y personalizadas según las necesidades de percepción del usuario. Modelos representativos del estado del arte incluyen _Llama V4_ @llama4 (Meta), con codificación multimodal y de código abierto; _GPT-4o_ @gpt4o (OpenAI) y _Gemini 1.5_ @gemini15 (Google), con integración nativa de texto, imagen y audio.


#v(.5cm)
== Modelos Generativos de Audio
#v(.2cm)
Los modelos generativos de audio representan sistemas capaces de crear sonidos y música a partir de prompts de texto. Estos modelos, basados en arquitecturas de aprendizaje profundo, pueden sintetizar desde sonidos de animales y objetos  (como el canto de pájaros o el sonido de una tormenta) hasta composiciones musicales, ajustándose a estilos, géneros o emociones específicas. Su funcionamiento se sustenta en la interpretación de instrucciones textuales o parámetros acústicos, permitiendo generar audio coherente y contextualizado sin necesidad de muestras preexistentes. Un ejemplo relevante es _AudioLDM_ @audioldm, que genera audio ambiental mediante modelos de difusión latente condicionados por descripciones textuales, utilizando embeddings CLAP @clap para mejorar la alineación semántica entre texto y sonido.


#v(.5cm)
== Modelos de Text to Speech
#v(.2cm)
Los modelos de _Text to Speech_ (TTS) constituyen sistemas computacionales que transforman texto escrito en habla sintética mediante técnicas de procesamiento de lenguaje natural y síntesis de voz. Los modelos de estado del arte están fundamentados en arquitecturas de aprendizaje profundo (incuyendo por lo general el uso de arquitecturas _Difussion_ y _Transformers_), analizan la estructura lingüística, semántica y prosódica del input textual para generar audio con entonación, ritmo y naturalidad cercanos a la expresión humana. Su aplicación abarca desde asistentes virtuales y herramientas de accesibilidad hasta sistemas de comunicación aumentativa, permitiendo la generación de voces personalizadas, multilingües y adaptadas a contextos específicos, lo que facilita la interacción con usuarios en entornos digitales y físicos. Arquitecturas de referencia en esta categoría incluyen _Tacotron 2_ @tacotron, basado en un encoder-decoder con mecanismo de atención que genera espectrogramas mel de forma autoregresiva, y _VITS_ @vits, que realiza síntesis end-to-end combinando flujos normalizadores y aprendizaje adversarial. Como implementación de uso práctico, _Kokoro-82M_ @kokorotts demuestra que es posible alcanzar voz de alta calidad con solo 82 millones de parámetros, incluyendo soporte para el idioma español.

#v(.5cm)
== Estándares de Accesibilidad
#v(.2cm)
Los estándares de accesibilidad proporcionan el marco normativo que guía el diseño de interfaces inclusivas, asegurando que los contenidos digitales sean utilizables por personas con diversas capacidades sensoriales, motoras o cognitivas. Entre los más relevantes se encuentran las Pautas de Accesibilidad para el Contenido Web (WCAG) @wcag, que establecen criterios relacionados con la perceptibilidad, operabilidad, comprensibilidad y robustez de los sistemas web. En el contexto chileno, estas directrices se integran mediante la Ley N.º 20.422 @ley20422, que regula la igualdad de oportunidades e incorpora exigencias específicas para tecnologías asistivas. La plataforma desarrollada en este proyecto adopta estos lineamientos para garantizar compatibilidad con lectores de pantalla, navegación por teclado, descripciones alternativas, controles auditivos accesibles y una estructura de interacción que facilite la exploración autónoma.

El cumplimiento de estos estándares es esencial para asegurar que la solución propuesta sea inclusiva y centrada en las necesidades de los usuarios objetivo.

#pagebreak()
