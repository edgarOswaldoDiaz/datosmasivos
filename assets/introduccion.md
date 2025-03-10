

### Introducción a los Datos Masivos

**Datos Masivos o Big Data** se refiere al conjunto de datos que, por su tamaño, complejidad y velocidad de generación, no pueden ser procesados ni gestionados adecuadamente con las herramientas tradicionales de manejo de datos. Este concepto ha ganado relevancia debido a la explosión de información digital proveniente de diversas fuentes, impulsada por la transformación digital.

---

### Conceptos y funciones de los Datos Masivos

#### **Conceptos**
- **Big Data**: Conjunto de datos tan grande y complejo que requiere nuevas formas de procesamiento para extraer conocimiento útil.
- **Análisis de Big Data**: Proceso de examinar grandes volúmenes de datos para descubrir patrones, correlaciones y tendencias significativas.
- **Ecosistema de Big Data**: Herramientas, tecnologías y metodologías utilizadas para procesar, almacenar y analizar grandes volúmenes de datos.

#### **Funciones**
- **Almacenamiento**: Facilitar la recolección y almacenamiento eficiente de datos.
- **Procesamiento**: Transformar datos brutos en información estructurada y útil.
- **Análisis**: Extraer información valiosa mediante algoritmos, estadísticas y modelos predictivos.
- **Visualización**: Presentar resultados de forma comprensible para los tomadores de decisiones.
- **Automatización**: Usar los datos para activar respuestas automáticas o mejorar procesos.

---

### Características de Datos Masivos (Las 5 V’s)

**Volumen**:
   - Representa la cantidad masiva de datos generados, que pueden alcanzar terabytes o petabytes.
   - Ejemplo: Datos generados por redes sociales, transacciones bancarias, o sensores IoT.

**Velocidad**:
   - Se refiere a la rapidez con la que los datos se generan, procesan y analizan.
   - Ejemplo: Análisis en tiempo real de transacciones financieras para prevenir fraudes.

**Variedad**:
   - Indica los diferentes tipos y formatos de datos (estructurados, no estructurados y semiestructurados).
   - Ejemplo: Texto, imágenes, videos, audio, datos tabulares.

**Veracidad**:
   - Relacionada con la calidad y confiabilidad de los datos.
   - Ejemplo: Datos provenientes de fuentes confiables versus información incompleta o incorrecta.

**Valor**:
   - La utilidad o relevancia que los datos tienen para la toma de decisiones.
   - Ejemplo: Identificación de patrones de comportamiento en clientes para personalizar servicios.

---

### Fuentes de Grandes Volúmenes de Datos

**Redes sociales**: Facebook, X antes Twitter, Instagram.
**Sensores y dispositivos IoT**: Sensores industriales, dispositivos domésticos inteligentes.
**Sistemas transaccionales**: Registros bancarios, sistemas de punto de venta.
**Datos abiertos**: Datos públicos de gobiernos o instituciones.
**Plataformas de streaming**: YouTube, Netflix, Spotify.
**Registros médicos y científicos**: Estudios genómicos, datos de pacientes, investigación climática.

---

### Arquitecturas para el Análisis de los Datos Masivos

#### **Batch Processing (Procesamiento por lotes)**  
**Descripción**:  
El procesamiento por lotes se utiliza para manejar grandes volúmenes de datos que no requieren análisis en tiempo real. Los datos se acumulan y se procesan en un momento específico.

**Caso de uso ficticio**: **Empresa "EcoMarket"**  
EcoMarket, un supermercado en línea, utiliza Hadoop para analizar las compras de los clientes realizadas durante el mes. Este análisis por lotes permite identificar patrones de consumo estacional y planificar mejor el inventario para productos como frutas, vegetales y artículos promocionales. Los datos se procesan cada semana para generar reportes detallados sobre ventas, tendencias y márgenes de ganancia.

---

#### **Stream Processing (Procesamiento en tiempo real)**  
**Descripción**:  Procesamiento continuo y en tiempo real de datos que llegan en forma de flujo. Es ideal para aplicaciones que requieren respuestas instantáneas.

**Caso de uso ficticio**:  **Empresa "FinGuard"**  
FinGuard, una fintech que ofrece servicios de pagos, utiliza Apache Kafka para detectar transacciones fraudulentas en tiempo real. Cada vez que un cliente realiza una transacción, los datos se analizan al instante. Si el sistema identifica actividad sospechosa, como múltiples intentos de retiro desde ubicaciones diferentes en un tiempo corto, bloquea automáticamente la cuenta y envía una alerta al cliente.

---

#### **Arquitectura Lambda**  
**Descripción**:  Combina procesamiento por lotes (para análisis a largo plazo) y en tiempo real (para análisis inmediato), ofreciendo un balance entre ambos enfoques.

**Caso de uso ficticio**:  **Empresa "MediPulse"**  
MediPulse, una empresa de telemedicina, usa la arquitectura Lambda para monitorear datos de dispositivos de salud conectados de pacientes crónicos.  
- **Stream Processing**: Detecta anomalías críticas en tiempo real, como un aumento peligroso en la frecuencia cardíaca.  
- **Batch Processing**: Almacena y analiza datos históricos para proporcionar a los médicos informes semanales con tendencias de salud del paciente.  

---

#### **Arquitectura Kappa**  
**Descripción**:  Enfocada exclusivamente en procesamiento en tiempo real, simplifica el diseño al eliminar la necesidad de procesamiento por lotes.

**Caso de uso ficticio**:  **Empresa "SmartDrive"**  
SmartDrive, un servicio de taxis autónomos, utiliza una arquitectura Kappa para analizar datos en tiempo real provenientes de sensores de vehículos. Esto incluye información sobre tráfico, clima y estado del vehículo. Los datos se procesan continuamente para ajustar rutas y evitar atascos, asegurando una experiencia óptima para los pasajeros.

---

#### **Bases de Datos NoSQL**  
**Descripción**:  Diseñadas para manejar datos no estructurados o semiestructurados. Son escalables y flexibles, ideales para aplicaciones con alta variabilidad en los datos.

**Caso de uso ficticio**:  **Empresa "ShopVerse"**  
ShopVerse, una plataforma de comercio electrónico, utiliza MongoDB para almacenar datos de productos. Cada producto tiene atributos variados (como color, talla, marca, materiales, etc.), que cambian según la categoría. La flexibilidad de NoSQL permite manejar estos datos sin la rigidez de un esquema tradicional. Esto ayuda a ShopVerse a integrar rápidamente nuevos productos en su catálogo.

---

#### **Data Lakes**  
**Descripción**:  Repositorios que almacenan grandes volúmenes de datos en su formato original (estructurado y no estructurado). Permiten análisis futuros sin procesar previamente los datos.

**Caso de uso ficticio**:  **Empresa "WeatherPredict"**  
WeatherPredict, una startup que analiza datos meteorológicos, utiliza un Data Lake en Amazon S3 para almacenar datos de satélites, estaciones climáticas y sensores IoT. Los científicos pueden acceder a estos datos crudos para realizar simulaciones complejas de predicción climática y generar alertas tempranas para desastres naturales.

---

#### **Data Warehouses**  
**Descripción**:  Diseñados para análisis estructurado y consultas avanzadas, integran datos procesados de diversas fuentes para proporcionar reportes empresariales.

**Caso de uso ficticio**:  **Empresa "TravelLux"**  
TravelLux, una agencia de viajes de lujo, utiliza Snowflake como su Data Warehouse. Consolida datos de reservas, preferencias de clientes y tendencias de destinos. Los analistas generan reportes trimestrales que identifican destinos populares y clientes frecuentes, lo que permite diseñar campañas personalizadas de marketing y paquetes exclusivos.

#### Visión empresarial 

<img src="/assets/Estrategia_Empresarial.jpg">

<img src="/assets/BPM.jpg">

<img src="/assets/DevSecOps_and_DataSecOps.jpg">

| **Aspecto**                | **DevSecOps**                                                                 | **DataSecOps**                                                                 |
|----------------------------|------------------------------------------------------------------------------|------------------------------------------------------------------------------|
| **Definición**             | Es un enfoque que integra la seguridad (Security) en el ciclo de vida de desarrollo de software (DevOps). | Es un enfoque que integra la seguridad (Security) en el ciclo de vida de la gestión de datos. |
| **Enfoque principal**      | Garantizar que las aplicaciones y sistemas desarrollados sean seguros desde su diseño hasta su implementación. | Proteger la seguridad, privacidad y gobernanza de los datos a lo largo de todo su ciclo de vida. |
| **Objetivo**               | Mitigar vulnerabilidades en el código, la infraestructura y los procesos de desarrollo. | Garantizar la protección de los datos contra accesos no autorizados, pérdidas o brechas. |
| **Componentes clave**      | Desarrollo de software seguro, pruebas de seguridad automatizadas, auditorías de código. | Gobernanza de datos, cifrado, control de acceso basado en roles, monitoreo de uso de datos. |
| **Ámbito de aplicación**   | Aplicaciones, sistemas y servicios de software en todas las etapas de desarrollo e implementación. | Bases de datos, flujos de datos, almacenamiento y análisis de datos. |
| **Herramientas comunes**   | - SAST (Static Application Security Testing) <br> - DAST (Dynamic Application Security Testing) <br> - Controles CI/CD seguros (ej., Jenkins, GitHub Actions). | - Sistemas de clasificación y etiquetado de datos <br> - Herramientas de monitoreo de datos (ej., DataDog, Splunk) <br> - Plataformas de privacidad de datos (ej., Privacera, Immuta). |
| **Proceso de integración** | La seguridad se incluye como una parte integral de DevOps, involucrando equipos de desarrollo, operaciones y seguridad. | La seguridad de los datos se alinea con los flujos de trabajo de datos, involucrando equipos de analistas, ingenieros de datos y especialistas en gobernanza. |
| **Beneficiarios principales** | Usuarios de software, equipos de desarrollo y organizaciones que buscan minimizar riesgos en aplicaciones y servicios. | Usuarios finales, analistas de datos, organizaciones que manejan datos sensibles o regulados. |
| **Riesgos mitigados**      | Vulnerabilidades de software, ataques de inyección, configuraciones erróneas en infraestructura. | Filtración de datos, accesos no autorizados, cumplimiento de regulaciones como GDPR, HIPAA o CCPA. |
| **Ejemplo de implementación** | Integrar pruebas de seguridad automatizadas en una tubería CI/CD para identificar problemas de seguridad antes de la producción. | Aplicar políticas de gobernanza para el acceso a datos sensibles y el uso de técnicas de anonimización o pseudonimización. |

### Diferencia clave:
- **DevSecOps** se centra en la **seguridad del software y sistemas** en el ciclo de desarrollo y operación.
- **DataSecOps** se enfoca en la **seguridad y gobernanza de los datos** a lo largo de su ciclo de vida. 

### **Tabla de Funciones y Actividades de los Roles DataSecOps y DevSecOps**

| **Aspecto**              | **DevSecOps**                                                                 | **DataSecOps**                                                                 |
|--------------------------|------------------------------------------------------------------------------|------------------------------------------------------------------------------|
| **Propósito principal**  | Integrar la seguridad en todas las etapas del ciclo de desarrollo de software y operaciones. | Garantizar la seguridad, privacidad y gobernanza de los datos durante todo su ciclo de vida. |
| **Enfoque**              | Seguridad en aplicaciones, infraestructura y procesos de desarrollo.          | Seguridad y control en el acceso, procesamiento, almacenamiento y uso de datos. |
| **Funciones principales**|                                                                              |                                                                              |
| **1. Planificación**     | - Evaluar riesgos en sistemas y aplicaciones desde el diseño.                 | - Identificar riesgos relacionados con los datos y definir políticas de gobernanza. |
| **2. Desarrollo**        | - Implementar prácticas de desarrollo seguro (secure coding).                 | - Diseñar flujos de datos con protección para datos sensibles. |
| **3. Automatización**    | - Configurar herramientas CI/CD con controles de seguridad integrados.        | - Automatizar la clasificación, etiquetado y monitoreo de datos. |
| **4. Auditoría y monitoreo** | - Monitorear vulnerabilidades en infraestructura y software en tiempo real. | - Supervisar accesos a datos y asegurar el cumplimiento de normativas. |
| **5. Gestión de incidentes** | - Responder a brechas de seguridad en software o infraestructura.           | - Gestionar brechas de seguridad en datos y asegurar la notificación a las autoridades cuando sea necesario. |
| **6. Cumplimiento**      | - Garantizar que las aplicaciones cumplan con estándares como OWASP, ISO/IEC 27001. | - Asegurar el cumplimiento de normativas como GDPR, HIPAA, CCPA, etc. |
| **Actividades clave**    |                                                                              |                                                                              |
| **1. Seguridad proactiva** | - Revisar código fuente con herramientas de análisis estático (SAST).        | - Identificar datos sensibles y aplicar medidas como cifrado o anonimización. |
| **2. Integración de seguridad** | - Automatizar pruebas de seguridad en pipelines CI/CD.                  | - Integrar controles de seguridad en sistemas de análisis y almacenamiento de datos. |
| **3. Colaboración**       | - Trabajar con equipos de desarrollo y operaciones para abordar vulnerabilidades. | - Colaborar con ingenieros de datos y analistas para implementar políticas de gobernanza. |
| **4. Capacitación**       | - Entrenar a los desarrolladores en prácticas seguras de programación.        | - Capacitar al personal sobre el manejo de datos y su protección. |
| **Roles involucrados**    | - Ingenieros de DevSecOps <br> - Desarrolladores <br> - Administradores de sistemas <br> - Analistas de seguridad. | - Ingenieros de datos <br> - Especialistas en gobernanza de datos <br> - Científicos de datos <br> - Oficiales de privacidad. |
| **Herramientas comunes**  | - SAST, DAST, IAST (e.g., SonarQube, Checkmarx). <br> - Plataformas CI/CD seguras (e.g., Jenkins, GitHub Actions). <br> - Sistemas de monitoreo (e.g., ELK, Prometheus). | - Herramientas de gobernanza (e.g., Alation, Collibra). <br> - Sistemas de monitoreo y privacidad (e.g., DataDog, Splunk). <br> - Técnicas de cifrado y anonimización (e.g., AES, Differential Privacy). |
_________
<img src="/assets/PaaS.jpg">
_________

Referencias arbitradas:

- Dean, J., & Ghemawat, S. (2008). MapReduce: Simplified data processing on large clusters. *Communications of the ACM, 51*(1), 107-113. https://doi.org/10.1145/1327452.1327492

- Marz, N., & Warren, J. (2015). *Big Data: Principles and best practices of scalable real-time data systems*. Manning Publications.

- Kreps, J. (2014). Questioning the Lambda Architecture. *O’Reilly Media*. Retrieved from https://www.oreilly.com/

- Stonebraker, M., & Çetintemel, U. (2005). One size fits all: An idea whose time has come and gone. *Proceedings of the 21st International Conference on Data Engineering*, 2-11. https://doi.org/10.1109/ICDE.2005.1

- Grolinger, K., Hayes, M., Higashino, W., L’Heureux, A., Allison, D., & Capretz, M. A. M. (2014). Challenges for MapReduce in Big Data. *IEEE World Congress on Services*, 182-189. https://doi.org/10.1109/SERVICES.2014.42

- Chang, F., Dean, J., Ghemawat, S., Hsieh, W. C., Wallach, D. A., Burrows, M., Chandra, T., Fikes, A., & Gruber, R. E. (2008). Bigtable: A distributed storage system for structured data. *ACM Transactions on Computer Systems, 26*(2), 4. https://doi.org/10.1145/1365815.1365816

- Armbrust, M., Fox, A., Griffith, R., Joseph, A. D., Katz, R. H., Konwinski, A., ... & Zaharia, M. (2010). A view of cloud computing. *Communications of the ACM, 53*(4), 50-58. https://doi.org/10.1145/1721654.1721672

- Oussous, A., Benjelloun, F. Z., Lahcen, A. A., & Belfkih, S. (2018). Big Data technologies: A survey. *Journal of King Saud University-Computer and Information Sciences, 30*(4), 431-448. https://doi.org/10.1016/j.jksuci.2017.06.001

- Stonebraker, M., Abadi, D. J., DeWitt, D. J., Madden, S., Paulson, E., Pavlo, A., & Rasin, A. (2010). MapReduce and parallel DBMSs: Friends or foes? *Communications of the ACM, 53*(1), 64-71. https://doi.org/10.1145/1629175.1629197

- Zikopoulos, P. C., Eaton, C., deRoos, D., Deutsch, T., & Lapis, G. (2012). *Understanding Big Data: Analytics for enterprise class Hadoop and streaming data*. McGraw-Hill Osborne Media.
_________
> By CISO oswaldo.diaz@inegi.org.mx
