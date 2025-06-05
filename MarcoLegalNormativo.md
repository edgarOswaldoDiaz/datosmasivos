# Marco Legal y Normativo para la Implementación del Proyecto Del Indicador AI-Thena

El proyecto del indicador dentro de **AI-Thena** tiene como objetivo implementar un sistema de inteligencia artificial con capacidades de consulta avanzada sobre una base de datos de publicaciones en redes sociales mediante un pipeline de **Retrieval-Augmented Generation (RAG)**. En este contexto, es fundamental enmarcar su desarrollo técnico dentro de los principios y disposiciones legales vigentes en materia de tratamiento de datos personales y sistemas automatizados de decisión.

---

## 1. Tratamiento de datos personales: cumplimiento de la LFPDPPP y el GDPR

El proyecto AI-Thena hace uso de publicaciones públicas de Twitter, correspondientes al periodo 2020–2022. Aunque estos datos se originan en un entorno abierto, su transformación mediante modelos de lenguaje y técnicas de representación semántica (embeddings) puede derivar en inferencias que permitan identificar indirectamente a personas físicas. En virtud de ello, se debe aplicar lo establecido en:

### Ley Federal de Protección de Datos Personales en Posesión de los Particulares (LFPDPPP):
- Principios de **licitud**, **finalidad**, **proporcionalidad** y **responsabilidad**.
- Aplicación de **medidas de seguridad técnicas y administrativas** para proteger los datos durante su tratamiento.
- Uso de los datos únicamente con fines académicos, de investigación o desarrollo tecnológico sin fines de lucro.

### Reglamento General de Protección de Datos (GDPR):
- **Artículo 5**: Principios de **minimización de datos**, **limitación del tratamiento** y **exactitud**.
- **Artículos 9 y 22**: Garantía de que **ninguna decisión automatizada** afecte significativamente a los individuos sin su consentimiento explícito.
- **Artículo 25**: Aplicación del principio de **privacy by design and by default**, exigiendo que la protección de datos esté integrada desde la etapa de diseño del sistema.

---

## 2. Procesamiento de texto y generación de embeddings

La representación semántica de los tweets se llevará a cabo mediante modelos de lenguaje como `all-MiniLM`, que convierten texto en vectores numéricos (embeddings). Esta operación debe respetar el principio de proporcionalidad en el tratamiento de datos, asegurando que no se retenga más información de la necesaria, conforme a:

- **LFPDPPP - Artículos 6 y 11**: Los datos procesados deben limitarse a lo estrictamente indispensable y garantizar su exactitud.
- **GDPR - Artículo 32**: Requiere medidas técnicas que aseguren la integridad y confidencialidad de los datos durante su tratamiento.

---

## 3. Uso de RAG y agentes inteligentes (AI Agent)

AI-Thena utilizará un sistema de RAG para responder consultas a partir de un vector index creado con los embeddings de los datos. Este sistema será extendido mediante un agente inteligente con capacidades de análisis contextual. El uso de estos mecanismos requiere incorporar las siguientes disposiciones:

- **GDPR - Artículo 22**: Toda interacción con sistemas automatizados debe garantizar intervención humana significativa en decisiones que puedan tener impacto en derechos de los usuarios.
- **LFPDPPP - Artículo 16**: Requiere consentimiento informado para cualquier perfilado o tratamiento automatizado con fines de segmentación o respuesta personalizada.

También se recomienda observar principios de **IA ética y explicable** definidos por organismos como:

- ### OCDE (Organización para la Cooperación y el Desarrollo Económicos)
La OCDE fue una de las primeras organizaciones internacionales en adoptar formalmente una serie de **Principios sobre Inteligencia Artificial (2019)**, los cuales han sido respaldados por múltiples países. Estos principios buscan orientar el desarrollo de sistemas de IA hacia un beneficio social amplio, promoviendo:

- **IA centrada en el ser humano**: Los sistemas deben beneficiar a las personas y al planeta, maximizando el bienestar y sostenibilidad.
- **Transparencia y explicabilidad**: Los sistemas deben ser comprensibles para los usuarios, particularmente en decisiones automatizadas.
- **Robustez y seguridad**: Las aplicaciones de IA deben operar de manera confiable y segura, minimizando sesgos y errores.
- **Responsabilidad**: Los desarrolladores e implementadores deben ser responsables de los resultados y funcionamiento del sistema.
- **Rendición de cuentas**: Se deben establecer mecanismos para supervisar y auditar el comportamiento de los sistemas.

**Relevancia para AI-Thena**:  
Estos principios guían la necesidad de que AI-Thena sea transparente en su toma de decisiones, especialmente cuando el sistema filtre, clasifique o responda con base en información semántica. La rendición de cuentas y la explicabilidad deben integrarse desde el diseño.

---
- ### UNESCO (Organización de las Naciones Unidas para la Educación, la Ciencia y la Cultura)
En 2021, la UNESCO aprobó la **Recomendación sobre la Ética de la Inteligencia Artificial**, un marco global que va más allá de la privacidad e incluye valores culturales, sociales y humanos en el desarrollo de la IA. Algunos de sus pilares clave son:

- **Derechos humanos como eje rector**: La IA debe respetar los derechos fundamentales y la dignidad de todas las personas.
- **Inclusión y no discriminación**: Se debe prevenir cualquier tipo de sesgo algorítmico que pueda derivar en exclusión social o discriminación.
- **Diversidad cultural y lingüística**: Promueve el respeto por las particularidades locales y el multilingüismo en los sistemas IA.
- **Impacto ambiental**: Se alienta el desarrollo de tecnologías sostenibles que reduzcan su huella ecológica.
- **Gobernanza y supervisión ética**: Implementar mecanismos interdisciplinarios de evaluación ética durante todo el ciclo de vida del sistema.

**Relevancia para AI-Thena**:  
Implica que, además del cumplimiento legal, AI-Thena debe diseñarse considerando el impacto social y cultural del análisis automatizado de redes sociales. También sugiere evaluar continuamente los posibles efectos no deseados, incluyendo sesgos en los datos o desigualdad en los resultados ofrecidos por el sistema.

---
- ### NIST (Instituto Nacional de Estándares y Tecnología - EE. UU.)
El NIST ha desarrollado un marco técnico detallado para la gestión del riesgo en sistemas de inteligencia artificial: el **AI Risk Management Framework (AI RMF 1.0)**, publicado en 2023. Este marco se centra en mitigar riesgos asociados con el diseño, desarrollo, despliegue y uso de sistemas de IA. Sus principios clave incluyen:

- **Validez y confiabilidad**: Los sistemas deben comportarse como se espera en distintas condiciones.
- **Explicabilidad y trazabilidad**: Se deben entender las decisiones del sistema, y se debe poder seguir el origen de sus resultados.
- **Seguridad y resiliencia**: Proteger el sistema de ataques o manipulaciones.
- **Gestión del sesgo**: Detectar y corregir desviaciones perjudiciales durante el entrenamiento o la inferencia.
- **Transparencia operativa**: Documentar todo el ciclo de vida del sistema de forma accesible.

**Relevancia para AI-Thena**:  
Este marco se puede adoptar como guía técnica para el monitoreo continuo del comportamiento del sistema, la trazabilidad de las consultas (queries), la evaluación de la calidad de los embeddings y la verificación de la robustez del vector index ante entradas adversarias o fuera de distribución.

---

En particular, en lo relativo a:
- Trazabilidad de las decisiones generadas por el sistema.
- Capacidad de explicación de las respuestas emitidas por el LLM.
- Transparencia en la lógica de recuperación de información y generación de respuestas.

---

Para cumplir con los marcos legales y éticos mencionados, AI-Thena deberá:

- Diseñarse con una arquitectura explicable desde el nivel de vectorización hasta la generación de respuestas.
- Documentar todas las etapas del pipeline de RAG, desde el preprocesamiento hasta la recuperación semántica.
- Asegurar la participación de personas en el proceso de toma de decisiones cuando las respuestas generadas puedan impactar derechos.
- Minimizar el uso de datos personales y garantizar su anonimización en todo momento.
- Incluir evaluaciones éticas y técnicas periódicas para detectar sesgos, brechas de seguridad o impactos no intencionados.

## 4. Visualización y monitoreo (Dashboard)

La visualización del comportamiento del sistema mediante un dashboard debe limitarse a información agregada y anonimizada. Esto se alinea con:

- **LFPDPPP - Artículo 50**: Promueve la autorregulación vinculante para el tratamiento ético de datos.
- **GDPR - Considerando 71**: Exige transparencia significativa en los procesos algorítmicos que puedan ser interpretados por las partes interesadas.
