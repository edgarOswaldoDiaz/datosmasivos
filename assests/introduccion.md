
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

<img src="assests/Estrategia_Empresarial.jpg">

<img src="/assets/BPM.jpg">

<img src="/assets/DevSecOps_and_DataSecOps.jpg">

<img src="/assets/PaaS.jpg">

___________

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
