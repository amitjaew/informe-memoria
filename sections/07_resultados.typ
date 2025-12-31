#show figure.where(kind: raw): set figure(supplement: [Texto])

= Resultados
#v(.5cm)
== API Gateway
Sistema funciona correctamente...

#figure(
  image("../figs/api_swagger.png"),
  caption: "Documentación Swagger de la API"
)

#v(.5cm)
== Frontend
Aunque no se realizaron pruebas con los usuarios objetivo, se evaluó el funcionamiento de la navegación dentro del sitio mediante herramientas de accesibilidad diseñadas para usuarios con discapacidad visual.

#figure(
  image("../figs/frontend_main.png"),
  caption: "Frontend de la Plataforma"
)

#v(.5cm)
== Módulos Generativos

Como referiencia tomaremos la orbra El Aquelarre de Francisco de Goya

#figure(
  image("../figs/el_aquelarre_goya.jpeg", height: 40%),
  caption: [Obra "El Aquelarre" de Francisco de Goya]
)

#v(.2cm)
=== Generador de Audio Descriptivo

#figure(
  ```
  En la imagen se puede observar una representación de un ritual o acto de adoración hacia un macho cabrío. La figura del macho cabrío viste una corona de hojas y se encuentra en el centro de la composición. Está rodeado de personas que parecen estar participando en algún tipo de ceremonia.

  Al fondo de la escena se puede ver una luna creciente en el cielo nocturno, lo que sugiere que la escena se desarrolla durante la noche. Detrás del macho cabrío hay un grupo de personas vestidas con túnicas, algunas de las cuales tienen la cara cubierta.

  La escena general parece representar una temática relacionada con prácticas antiguas o rituales paganos.
  ```,
  caption: [Descripción de Obra El Aquelarre de Francisco de Goya]
)
*añadir link a wav*

#v(.5cm)
=== Generador de Narraciones de Contexto

Como es referenciado en @context-narration-script, la generación de la narración toma por entrada un articulo de Wikipedia, en este caso

#align(
  center,
  link("https://es.wikipedia.org/wiki/El_aquelarre_(1798)")
)

#figure(
  [
    ```
    En el palacio de recreo de los duques de Osuna, situado en la finca de la Alameda de Osuna, a las afueras de Madrid, Francisco de Goya pintó seis pequeños cuadros entre 1797 y 1798. Uno de ellos, "El aquelarre", es una obra que representa un ritual de brujería presidido por un gran macho cabrío, forma del demonio, rodeado de brujas ancianas y jóvenes que entregan niños, según la superstición de la época, para alimentar al demonio. La escena se desarrolla bajo un cielo nocturno iluminado por la luna, con animales nocturnos volando en el fondo, creando una atmósfera siniestra y oscura.

    La serie a la que pertenece "El aquelarre" forma parte de la estética del "sublime terrible", una corriente del prerromanticismo que buscaba generar desasosiego y una sensación de pesadilla en el espectador. Goya estaba trabajando en "Los Caprichos" en ese momento, una obra estrechamente relacionada temáticamente con la serie de cuadros para los duques de Osuna. La brujería era un tema de actualidad entre los ilustrados españoles amigos de Goya, y su interés en este tema se refleja en la ambientación nocturna y los tonos oscuros que predominan en "El aquelarre". La obra forma parte de la colección de la Fundación Lázaro Galdiano, después de ser adquirida por José Lázaro Galdiano en 1928.
    ```
  ],
  caption: [Narración de Obra El Aquelarre de Francisco de Goya]
)
*añadir link a wav*

#v(.5cm)
=== Generador de Sonidos Ambientales
*añadir link a wav*

#pagebreak()
