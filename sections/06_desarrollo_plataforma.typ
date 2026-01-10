= Desarrollo de la Plataforma
#v(.5cm)

/*
La arquitectura propuesta sigue un modelo cliente-servidor e incorpora una _API Gateway_ como componente central. Esta cumple dos funciones principales: por un lado, centraliza las operaciones computacionalmente intensivas (principalmente inferencia de modelos de aprendizaje automático y las solicitudes a APIs externas), y por otro, gestiona un catálogo centralizado de recursos.

*/
La arquitectura propuesta se fundamenta en un modelo cliente-servidor, decisión que responde a la necesidad de desacoplar las interfaces de usuario de los procesos computacionalmente intensivos asociados a la inferencia de modelos de aprendizaje automático y al procesamiento multimedia. Este enfoque permite, por un lado, mantener una experiencia de usuario fluida en dispositivos con capacidades limitadas y, por otro, facilitar la escalabilidad y mantenibilidad del sistema.

#v(.5cm)
== API Gateway
#v(.2cm)
Se incorpora una API Gateway como componente central de la arquitectura. La elección de una API Gateway se justifica por tres motivos principales:
- Centralizar el acceso a funcionalidades heterogéneas bajo una interfaz uniforme, reduciendo la complejidad del frontend
- Aislar los servicios internos del sistema, permitiendo su evolución independiente
- Concentrar las tareas de mayor costo computacional en un entorno controlado, optimizado para la ejecución de modelos de IA.

Además, se desarrolla un _frontend_ que aplica principios de accesibilidad, con especial atención a las necesidades de usuarios con discapacidad visual.

#figure(
  image("../figs/diagrama_arquitectura.png"),
  caption: "Arquitectura General de Sistema"
) <arqgeneralsistema>

#v(.2cm)
#pagebreak()
Se decide utilizar Django como framework por su capacidad para agilizar el desarrollo de APIs robustas mediante su sistema de ORM, su arquitectura basada en modelos-vistas-plantillas (MVT) y su ecosistema de paquetes especializados. Además, su soporte integrado para autenticación, manejo de rutas y middleware facilita la implementación de políticas de seguridad y gestión de solicitudes, aspectos críticos para en el futuro robustecer nuestro sistema con flujos de administración de contenido.

Nuestra API Gateway se divide en cuatro servicios independientes para garantizar un adecuado encapsulamiento durante el desarrollo de la plataforma (@arqgeneralsistema). Cada uno de estos servicios corresponde a un módulo débilmente acoplado, asociado a tablas específicas dentro del modelo de datos.

#v(.5cm)
=== Generador de Audio Descriptivo
#v(.2cm)

Este módulo se encarga de producir descripciones textuales detalladas de los contenidos visuales presentes en las obras. Para ello, emplea modelos de lenguaje multimodales, en particular _Llama V4 Maverick_ @llama4 para evaluar entrada de imagenes y texto.

La imagen se evalua junto a un _prompt_ diseñado para extraer información de los contenidos de la obra, además se añaden instrucciones para mantener una cadencia de redacción fluida (@descriptive-audio-gen).

Posteriormente, las descripciones generadas son convertidas a formato de audio mediante sistemas de síntesis de voz (TTS) (@kokoro-tts-generation) utilizando _Kokoro 82M_ @kokorotts.

#v(.5cm)
=== Generador de Narraciones de Contexto
#v(.2cm)

Este módulo genera narraciones auditivas que contextualizan históricamente cada obra. Para ello, se recopila información de fuentes autoritativas (en este caso, se procesó manualmente un conjunto de datos con artículos de Wikipedia vinculados a cada pieza) (@information-extraction-script). A partir de estos datos, se elabora un relato contextualizado y adaptado al caso de uso (@context-narration-script), que posteriormente se convierte en audio mediante modelos de síntesis de voz (Text to Speech) (@kokoro-tts-generation).

#pagebreak()
=== Generador de Sonidos Ambientales
#v(.2cm)

Este módulo se encarga de la generación de ambientes sonoros que representan los contenidos literales (no abstractos) de sus imagenes de entrada. La heuristica utilizada consiste en:
- Dividir el espacio en cuadrantes, en nuestro caso 9 (@image-quadrant-cropping), como se puede apreciar en @image-quadrant-segmentation-fig.
// - Procesar cada cuadrante con LLMs multimodales, obteniendo salidas estructuradas en JSON (@sound-ambient-element-extraction) representando cada elemento detectado.
- Procesar cada cuadrante mediante modelos de lenguaje multimodales (@sound-ambient-element-extraction). Por razones de operatividad con modelos de lenguaje y facilidad de interpretación se decide procesar la salida de esta parte en formato JSON.
- Por cada cuadrante generar una mezcla de sonido integrando todos los elementos detectados en cada respectiva sección (@sound-ambient-generation).

#v(.5cm)
#figure(
  image("../figs/cropped_image_demo.png", height: 50%),
  caption: [
    Segmentación por Cuadrantes de Obra "El Aquelarre"
  ]
) <image-quadrant-segmentation-fig>

#pagebreak()
=== Catálogo de Obras/Imágenes
#v(.5cm)
Se elaboró un conjunto de datos en formato JSON que incluye 30 obras artísticas @datasetbasesensoria, conteniendo todo el material requerido para generar el contenido de la plataforma. Este dataset incorpora, además, enlaces a los artículos de Wikipedia asociados a cada obra artística para tener referencias autoritativas en la generación de narraciones historicas sobre la producción de las mismas.

Una vez procesado el conjunto de datos, sus campos son expuestos a través de la *API* mediante endpoints específicos. Los datos textuales se almacenan en una base de datos SQLite, mientras que las imágenes y archivos de audio generados se guardan en el sistema de archivos local del backend.

#figure(
  image("../figs/datamodel.png"),
  caption: "Modelo de Datos de la Plataforma"
)

#pagebreak()
== Frontend
#v(.2cm)
El frontend se implementó utilizando NextJS para proporcionar acceso al contenido gestionado por la API Gateway. En su diseño, se incorporaron textos alternativos y etiquetas HTML descriptivas con el objetivo de garantizar una integración completa con herramientas de asistencia para usuarios con discapacidad visual. Asimismo, se desarrolló una interfaz de usuario que facilita la navegación mediante atajos de teclado, optimizando la accesibilidad y usabilidad del sistema.

#v(.5cm)
#figure(
  image("../figs/frontend_navegacion.png", height: 27%),
  caption: "Flujo de Navegación Frontend"
)

#v(1cm)
== Limitaciones
#v(.2cm)
Por limitaciones computacionales durante el desarrollo, los módulos no se integraron directamente en la API Gateway. En su lugar, se implementó un prototipo funcional en un cuadernillo Jupyter @cuadernillosensoria para validar el diseño y flujo de procesamiento. Esto permitió generar y preprocesar los conjuntos de datos necesarios, que fueron incorporados a la base de datos para su uso en la versión final.
#pagebreak()
