= Desarrollo de la Plataforma
#v(.5cm)
La arquitectura propuesta sigue un modelo cliente-servidor e incorpora un _API Gateway_ como componente central. Este elemento cumple dos funciones principales: por un lado, centraliza las operaciones computacionalmente intensivas (principalmente inferencia de modelos de aprendizaje automático y las solicitudes a APIs externas), y por otro, gestiona un catálogo centralizado de recursos. Además, se desarrolla un _frontend_ que aplica principios de accesibilidad web, con especial atención a las necesidades de usuarios con discapacidad visual.
#figure(
  image("../figs/diagrama_arquitectura.png"),
  caption: "Arquitectura General de Sistema"
)

#pagebreak()
== API Gateway
#v(.2cm)
La API Gateway consiste en un servidor de Django, encargado de controlar 4 servicios:
#v(.2cm)
=== Generador de Audio Descriptivo
#v(.2cm)

Este módulo se encarga de producir descripciones textuales detalladas y estructuradas de los contenidos visuales presentes en las obras. Para ello, emplea modelos de lenguaje multimodales, los cuales procesan tanto elementos gráficos como metadatos asociados mediante prompts especializados. Dichos prompts están diseñados para extraer información semántica relevante, garantizando una representación fiel y contextualizada del material original (@descriptive-audio-gen). Posteriormente, las descripciones generadas son convertidas a formato de audio mediante sistemas de síntesis de voz (TTS) (@kokoro-tts-generation), optimizados para ofrecer una experiencia auditiva clara y accesible.


#v(.5cm)
=== Generador de Narraciones de Contexto
#v(.2cm)

Este módulo genera narraciones auditivas que contextualizan históricamente cada obra. Para ello, se recopila información de fuentes autoritativas (en este caso, se procesó manualmente un conjunto de datos con artículos de Wikipedia vinculados a cada pieza) (@information-extraction-script). A partir de estos datos, se elabora un relato contextualizado y adaptado al caso de uso (@context-narration-script), que posteriormente se convierte en audio mediante modelos de síntesis de voz (Text to Speech) (@kokoro-tts-generation), asegurando una experiencia auditiva coherente y accesible.

#pagebreak()
=== Generador de Sonidos Ambientales
#v(.2cm)

Este módulo se encarga de la generación de ambientes sonoros que representan los contenidos literales (no abstractos) de sus imagenes de entrada. La heuristica utilizada consiste en:
- Dividir el espacio en cuadrantes, en nuestro caso 9 (@image-quadrant-cropping), como se puede apreciar en @image-quadrant-segmentation-fig.
- Procesar cada cuadrante con LLMs multimodales, obteniendo salidas estructuradas en JSON (@sound-ambient-element-extraction) representando cada elemento detectado.
- Por cada cuadrante generar una mezcla de sonido integrando todos los elementos detectados en cada respectiva sección. (@sound-ambient-generation)

#v(.5cm)
#figure(
  image("../figs/cropped_image_demo.png", height: 50%),
  caption: [
    Ejemplo de segmentación de imagen en cuadrantes
    #linebreak()
    Obra: El Macho Cabrío, Francisco de Goya
  ]
) <image-quadrant-segmentation-fig>

#pagebreak()
=== Catálogo de Obras/Imagenes
#v(.5cm)
Se elaboró un conjunto de datos en formato JSON que incluye 30 obras artísticas, conteniendo todo el material requerido para el funcionamiento de los sistemas previamente descritos. Este dataset incorpora, además, enlaces a los artículos correspondientes de Wikipedia asociados a cada obra artística. *(ANEXO)*

Una vez procesado el conjunto de datos, sus campos son expuestos a través de la *API* mediante endpoints específicos. Los datos textuales se almacenan en una base de datos SQLite, mientras que las imágenes y archivos de audio generados se guardan en el sistema de archivos local del backend.

#figure(
  image("../figs/datamodel.png"),
  caption: "Modelo de Datos de la Plataforma"
)

#pagebreak()
== Frontend
#v(.2cm)
El frontend se implementó utilizando NextJS para proporcionar acceso al contenido gestionado por la API Gateway. En su diseño, se incorporaron textos alternativos y etiquetas HTML semánticas con el objetivo de garantizar una integración completa con herramientas de asistencia para usuarios con discapacidad visual. Asimismo, se desarrolló una interfaz de usuario que facilita la navegación mediante atajos de teclado, optimizando la accesibilidad y usabilidad del sistema.

#figure(
  image("../figs/frontend_navegacion.png", height: 27%),
  caption: "Flujo de Navegación Frontend"
)

#v(.5cm)
== Limitaciones
#v(.2cm)
Por limitaciones computacionales durante el desarrollo, los módulos no se integraron directamente en la API Gateway. En su lugar, se implementó un prototipo funcional en un cuadernillo Jupyter para validar el diseño y flujo de procesamiento. Esto permitió generar y preprocesar los conjuntos de datos necesarios, que fueron incorporados a la base de datos para su uso en la versión final.

#align(
  center,
  [
  *Cuadernillo:* #link("https://www.kaggle.com/code/alexeymitjaew/sound-generation-pipeline")
  ]
)

#pagebreak()
