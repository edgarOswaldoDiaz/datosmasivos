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

- **OCDE**
- **UNESCO**
- **NIST**

En particular, en lo relativo a:
- Trazabilidad de las decisiones generadas por el sistema.
- Capacidad de explicación de las respuestas emitidas por el LLM.
- Transparencia en la lógica de recuperación de información y generación de respuestas.

---

## 4. Visualización y monitoreo (Dashboard)

La visualización del comportamiento del sistema mediante un dashboard debe limitarse a información agregada y anonimizada. Esto se alinea con:

- **LFPDPPP - Artículo 50**: Promueve la autorregulación vinculante para el tratamiento ético de datos.
- **GDPR - Considerando 71**: Exige transparencia significativa en los procesos algorítmicos que puedan ser interpretados por las partes interesadas.
