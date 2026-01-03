#show figure.where(kind: raw): set figure(supplement: [Texto])

= Resultados
#v(.2cm)
== API Gateway
#v(.2cm)
El sistema opera correctamente, incluye autodocumentación en _Swagger_ y _OpenAPI_ y un conjunto completo de operaciones CRUD para todos los modulos de la plataforma.

Debido a las limitaciones computacionales mencionadas previamente, los endpoints solamente habilitan operaciones de lectura y escritura en la base de datos y sistema de archivos para facilitar la subida de elementos preprocesados.

El sistema permite tanto la consulta general de los elementos registrados (obras, autores, períodos históricos, entre otros) como la gestión individual de estos en cada uno de los módulos correspondientes.

#v(.4cm)
#figure(
  image("../figs/api_swagger.png"),
  caption: "Documentación Swagger de la API"
)

#v(.4cm)
Para garantizar compatibilidad con APIs externas de servicios de cómputo, los datos no estructurados (imágenes y audio) se transmiten codificados en base64. Este método, aunque aumenta el volumen de datos (alrededor del 30%), facilita la integración con SDKs de proveedores de inferencia compatibles con la API de OpenAI (como Groq, Novita o TogetherAI). Como mejora futura, se propone adoptar multipart-form-data en la subida y carga de archivos para optimizar el rendimiento de la plataforma.

#pagebreak()
== Frontend
#v(.4cm)

Aunque no se realizaron pruebas con los usuarios objetivo, se evaluó el funcionamiento de la navegación dentro del sitio mediante herramientas de accesibilidad diseñadas para usuarios con discapacidad visual.

#v(.2cm)
#figure(
  image("../figs/frontend_main.png"),
  caption: "Frontend de la Plataforma"
)
#v(.4cm)

La funcionalidad de navegación implementa correctamente búsquedas por obra, autor, período y técnica. Sin embargo, el sistema emplea un mecanismo de coincidencia de cadenas que no considera variaciones ortográficas como los acentos, lo que introduce cierta rigidez en la experiencia de usuario.

#v(.2cm)
#figure(
  image("../figs/frontend_search.png"),
  caption: "Funcionalidad de Búsqueda en Frontend"
)
#v(.4cm)

La implementación de la visualización de obras y sus módulos asociados opera de manera adecuada, logrando una integración efectiva del contenido audiovisual.

#pagebreak()
== Módulos Generativos
#v(.4cm)
A continuación se exponen los resultados obtenidos en los módulos generativos de la plataforma. Tal como se indicó en la sección anterior, estos componentes fueron implementados en un entorno independiente (cuadernillo hosteado en Kaggle) como parte de un desarrollo modular complementario al sistema principal.

Como caso de estudio representativo, se ha seleccionado la obra *El Aquelarre* de Francisco de Goya para ilustrar el funcionamiento de los módulos.

#v(.4cm)
#figure(
  image("../figs/el_aquelarre_goya.jpeg", height: 40%),
  caption: [Obra "El Aquelarre" de Francisco de Goya]
)
#v(.6cm)

A continuación, se evalúan los siguientes aspectos de los módulos implementados
- La calidad del texto en los módulos de _Audio Descriptivo_ y _Narraciones de Contexto_.
- La fidelidad y realismo del audio producido por el _Generador de Sonidos Ambientales_.
- La naturalidad y claridad de la voz sintetizada empleada en las pruebas de concepto.

#pagebreak()
=== Generación de Texto de Audio Descriptivo
#v(.4cm)
Se aprecia una alta correspondencia entre las imagenes de entrada y las descripciones generadas, manteniendo una cadencia natural para el posterior procesamiento con modelos de texto a voz.
Esto sugiere que una estrategia de _prompting_ directo es suficiente para que un _modelo de lenguaje multimodal_ describa efectivamente los contenidos de una obra, sin necesitar referencias autoritativas sobre esta (e.g. Wikipedia).

#v(.4cm)
*El Aquellare:*
#figure(
  [```
  En la imagen se puede observar una representación de un ritual o acto de adoración hacia un macho cabrío. La figura del macho cabrío viste una corona de hojas y se encuentra en el centro de la composición. Está rodeado de personas que parecen estar participando en algún tipo de ceremonia.

  Al fondo de la escena se puede ver una luna creciente en el cielo nocturno, lo que sugiere que la escena se desarrolla durante la noche. Detrás del macho cabrío hay un grupo de personas vestidas con túnicas, algunas de las cuales tienen la cara cubierta.

  La escena general parece representar una temática relacionada con prácticas antiguas o rituales paganos.
  ```
  #v(.2cm)
  ],
  caption: [Descripción de Obra El Aquelarre de Francisco de Goya]
)

#pagebreak()
=== Generación de Texto de Narraciones de Contexto
#v(.4cm)
Como es señalado en @context-narration-script, la generación de la narración toma por entrada un articulo de Wikipedia, en este caso
#align(
  center,
  link("https://es.wikipedia.org/wiki/El_aquelarre_(1798)")
)

Una comparación cruzada entre el texto generado y la información contenida en el artículo de Wikipedia demuestra una adecuada correspondencia con la fuente original, logrando transformar el contenido enciclopédico en una narración fluida y de carácter natural.

El pipeline cumple sus objetivos al generar narraciones contextuales fluidas y coherentes. Aunque necesita ajustes para casos como anglicismos o siglas, evita alucinaciones comunes en consultas directas a modelos de lenguaje.

#v(.4cm)
*El Aquellare:*
#figure(
  [
    ```
    En el palacio de recreo de los duques de Osuna, situado en la finca de la Alameda de Osuna, a las afueras de Madrid, Francisco de Goya pintó seis pequeños cuadros entre 1797 y 1798. Uno de ellos, "El aquelarre", es una obra que representa un ritual de brujería presidido por un gran macho cabrío, forma del demonio, rodeado de brujas ancianas y jóvenes que entregan niños, según la superstición de la época, para alimentar al demonio. La escena se desarrolla bajo un cielo nocturno iluminado por la luna, con animales nocturnos volando en el fondo, creando una atmósfera siniestra y oscura.
    La serie a la que pertenece "El aquelarre" forma parte de la estética del "sublime terrible", una corriente del prerromanticismo que buscaba generar desasosiego y una sensación de pesadilla en el espectador. Goya estaba trabajando en "Los Caprichos" en ese momento, una obra estrechamente relacionada temáticamente con la serie de cuadros para los duques de Osuna. La brujería era un tema de actualidad entre los ilustrados españoles amigos de Goya, y su interés en este tema se refleja en la ambientación nocturna y los tonos oscuros que predominan en "El aquelarre". La obra forma parte de la colección de la Fundación Lázaro Galdiano, después de ser adquirida por José Lázaro Galdiano en 1928.
    ```
    #v(.2cm)
  ],
  caption: [
    Narración de Obra El Aquelarre de Francisco de Goya
  ]
)

#pagebreak()
=== Generador de Sonidos Ambientales

#pagebreak()

=== Audio Generado con TTS
*añadir link a wav*

#pagebreak()
