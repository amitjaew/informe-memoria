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
Para garantizar compatibilidad con APIs externas de servicios de cómputo, los datos no estructurados (imágenes y audio) se transmiten codificados en base64. Este método, aunque aumenta el tamaño de los datos enviados (alrededor del 33%), facilita la integración con SDKs de proveedores de inferencia compatibles con la API de OpenAI (como Groq, Novita o TogetherAI). Como mejora futura, se propone adoptar multipart-form-data en la subida y carga de archivos para optimizar el rendimiento de la plataforma.

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

La funcionalidad de navegación implementa correctamente búsquedas por obra, autor, período y técnica. Sin embargo, el sistema emplea un mecanismo de coincidencia de strings que espera un match de acentuación, lo que hace rígida la utilización de la barra de busqueda.

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
A continuación se exponen los resultados obtenidos en los módulos generativos de la plataforma. Tal como se indicó en la sección anterior, estas componentes fueron implementadas en un entorno independiente @cuadernillosensoria como parte de un desarrollo modular complementario al sistema principal.

Como caso de estudio representativo, se ha seleccionado la obra *El Aquelarre* de Francisco de Goya para ilustrar el funcionamiento de los módulos.

#v(.4cm)
#figure(
  image("../figs/el_aquelarre_goya.jpeg", height: 40%),
  caption: [Obra "El Aquelarre" de Francisco de Goya]
)
#v(.6cm)

A continuación, se evalúan los siguientes aspectos:
- La calidad del texto en los módulos de _Audio Descriptivo_ y _Narraciones de Contexto_.
- La fidelidad y realismo del audio producido por el _Generador de Sonidos Ambientales_.
- La naturalidad y claridad de la voz sintetizada empleada en las pruebas de concepto.

#pagebreak()
=== Generación de Texto de Audio Descriptivo
#v(.4cm)
Los resultados obtenidos demuestran una notable correspondencia entre las imágenes de entrada y las descripciones generadas, las cuales mantienen una estructura sintáctica y una cadencia adecuadas para su posterior procesamiento mediante modelos de _Text to Speech_. Este hallazgo sugiere que una estrategia basada en _prompting directo_ resulta suficiente para que un modelo de lenguaje multimodal genere descripciones precisas del contenido visual de una obra, sin requerir fuentes autoritativas externas (como artículos de Wikipedia) de referencia para complementar el análisis.

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
#v(1cm)
La suficiencia de los modelos de lenguaje sin necesidad de incluir información extraída de fuentes autoritativas contrasta con lo observado en el siguiente módulo.

#pagebreak()
=== Generación de Texto de Narraciones de Contexto
#v(.4cm)
Como es señalado en @context-narration-script, para evitar alucinaciones y producir información rica en contexto se toma por entrada un articulo de Wikipedia, para el caso ilustrado:
#align(
  center,
  link("https://es.wikipedia.org/wiki/El_aquelarre_(1798)")
)

Una comparación cruzada entre el texto generado y la información contenida en el artículo de Wikipedia demuestra una adecuada correspondencia con la fuente original, logrando transformar el contenido enciclopédico en una narración fluida y de carácter natural.

El pipeline genera narraciones contextuales y evita alucinaciones vistas en prototipos anteriores de este módulo al utilizar consultas directas a modelos de lenguaje.

Un trabajo pendiente es la corrección de casos borde, en particular anglicismos y siglas.


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
#v(.4cm)

El proceso de detección de elementos acústicos en la obra presenta un desempeño adecuado, aunque se observan alucinaciones ocacionales en la identificación de componentes específicos, como puede apreciarse en el objeto detectado en segunda imagen de @element-dettection-demo. No obstante, por lo general los elementos detectados mantienen coherencia temática con el contenido representado.
// resultado atribuible al mapeo en el espacio latente implementado en la pipeline visual de _Llamav4 Maverick_ @llama4.
#figure(
  [
    #table(
      columns: (100pt, auto),
      align: center + horizon,
      rows: (auto, 5cm),

      [*Segmento*], [*Sonidos Generados*],
      /*
      [
        #image("../figs/el_aquelarre_tile_0_0.jpg")
      ],
      [
        #table(
          columns: (auto, 80%),
          align: left,
          [*Fondo*], [night sky],
          [*Objeto*], [birds flying],
          [*Fondo*], [stars, wind],
          [*Objeto*], [birds flying]
        )
      ],
      */
      [
        #image("../figs/el_aquelarre_tile_1_1.jpg")
      ],
      [
        #table(
          columns: (auto, 80%),
          align: left,
          [*Objeto*], [goat bleating],
          [*Fondo*], [tree branch creaking, people whispering],
          [*Audio*], [https://youtu.be/dqOECGiEiBI]
        )
      ],
      [
        #image("../figs/el_aquelarre_tile_2_0.jpg")
      ],
      [
        #table(
          columns: (auto, 80%),
          align: left,
          [*Fondo*], [sand],
          [*Objeto*], [puppy sleeping],
          [*Audio*], [https://youtu.be/mT7UBvVd9m8]
        )
      ],
    )
  ],
  caption: [
    Muestra de Elementos Detectados en Obra "El Aquelarre"
  ]
) <element-dettection-demo>
#v(.4cm)

Respecto a la calidad del audio generado se puede decir que, aunque la mayoría de los cuadrantes producen resultados verosímiles y coherentes con las escenas representadas, se observa un grado variable de ruido y artefactos en las mezclas de sonido y se identifican _outliers_ donde los ambientes degeneran en ruido. Este comportamiento sugiere limitaciones en la generalización del modelo ante elementos visuales ambiguos y/o composiciones atípicas dentro de las obras.

#pagebreak()
=== Audio Generado con TTS
#v(.4cm)
La implementación del módulo de Text-to-Speech (TTS) (@kokoro-tts-generation) utilizando _Kokoro82M_ @kokorotts demostró un nivel de naturalidad adecuado para la generación de audio en español, con una entonación fluida y una pronunciación generalmente clara de los textos descriptivos y narrativos. El tono neutral adoptado por el modelo resulta apropiado para una aplicación de accesibilidad cultural, ya que evita sesgos emocionales que podrían interferir con la percepción objetiva del contenido.

No obstante, se identificaron dificultades específicas en la pronunciación de anglicismos y siglas. Términos y nombres propios de otros idiomas son interpretados con reglas fonéticas del español, generando resultados poco intuitivos para el oyente. Esta limitación sugiere la necesidad de implementar un preprocesamiento que genere descripciones alternativas para dicho contenido (lo que fué implementado parcialmente en las estrategias de prompting de la generación de narraciones de contexto, ver @context-narration-script) o, alternativamente, incorporar un diccionario de excepciones para preservar la inteligibilidad en contextos técnicos.

#v(1cm)
Los audios generados para la descripción y la narración de "El Aquelarre" se pueden encontrar en los siguientes vínculos:
- *Descripción*: https://youtu.be/7NwKlbHQKeo
- *Narración*: https://youtu.be/P9EOz7Au4ZA

#pagebreak()
