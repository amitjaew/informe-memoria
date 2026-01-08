#set text(lang: "es")

#set page(
  margin: (
    top: 3cm,
    bottom: 3cm,
    left: 4cm,
    right: 3cm
  ),
  numbering: none
)
#set par(justify: true, leading: 1.5em)

// Header / footer
// #set header()
// #set footer(center: page-number())

// -----------------------------------------------------
// Title page
// -----------------------------------------------------
#pagebreak(weak: true)
#include "sections/00_front_page.typ"

#include "sections/01_agradecimientos.typ"
#include "sections/02_resumen.typ"

#pagebreak()
// Indice de imagenes (figuras) y tablas
//

#outline(title: "Lista de Figuras", target: figure.where(kind: image))
#outline(title: "Lista de Tablas", target: figure.where(kind:table))

#pagebreak()
#outline(title: "Contenidos")
#pagebreak()

#set heading(numbering: "I.1.a")
#show heading.where(level: 1): set heading(numbering: "I)")
#show heading.where(level: 2): set heading(numbering: "I.1)")
// -----------------------------------------------------
// Capítulos
// -----------------------------------------------------
#include "sections/03_intro.typ"
#include "sections/04_marco_teorico.typ"
#include "sections/05_estado_del_arte.typ"
#include "sections/06_desarrollo_plataforma.typ"
#include "sections/07_resultados.typ"
#include "sections/08_conclusiones.typ"

// -----------------------------------------------------
// Bibliografía
// -----------------------------------------------------
#bibliography("sections/09_bibliografia.bib")
#pagebreak()

#include "sections/10_anexo.typ"
