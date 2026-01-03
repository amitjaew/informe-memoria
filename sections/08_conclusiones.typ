= Conclusiones
#v(.4cm)

Este trabajo presentó el diseño, implementación y evaluación de una plataforma para mejorar el acceso al patrimonio artístico mediante inteligencia artificial generativa, con especial atención a la accesibilidad para personas con discapacidad visual.

Los resultados obtenidos evidencian que los modelos multimodales empleados son capaces de generar descripciones visuales precisas y estructuradas, así como narraciones de contexto históricamente coherentes, sin incurrir en alucinaciones significativas cuando se utilizan estrategias de prompting y fuentes autoritativas controladas. Asimismo, la generación de ambientes sonoros, si bien presenta limitaciones en términos de ruido y estabilidad en casos específicos, logra aportar una dimensión sensorial adicional que enriquece la experiencia auditiva y refuerza la comprensión del contenido visual de las obras.

Desde el punto de vista de la accesibilidad, el frontend desarrollado incorpora buenas prácticas de diseño inclusivo, tales como el uso de semántica HTML, textos alternativos y elementos optimizados para navegación por teclado, lo que permite una integración efectiva con herramientas de asistencia. Aunque no se realizaron pruebas con usuarios finales, las evaluaciones preliminares indican que la plataforma cumple con los objetivos funcionales propuestos y sienta una base sólida para futuras validaciones con el público objetivo.

Finalmente, las limitaciones computacionales que obligaron a separar los módulos generativos del sistema principal no invalidan la propuesta, aunque plantean el desafío de incorporar servicios que integren de manera eficiente tanto los módulos de inferencia autohosteados (AudioLDM y Kokoro TTS en este caseo) como servicios externos de inferencia. Como trabajo futuro, se propone la integración completa de los módulos en la API Gateway, la optimización del manejo de archivos multimedia, la mejora en la robustez del generador de sonidos ambientales y la realización de estudios de usabilidad con usuarios con discapacidad visual.

#pagebreak()
