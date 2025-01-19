### **Riesgos de Ciberseguridad en las Arquitecturas para el Análisis de los Datos Masivos**

---

#### **Batch Processing (Procesamiento por lotes)**  
**Descripción del riesgo**:  
El procesamiento por lotes acumula grandes cantidades de datos antes de procesarlos, lo que lo convierte en un objetivo atractivo para ataques cibernéticos.  
- **Ataques comunes**: 
  - **Exfiltración de datos masivos**: Los datos en reposo suelen ser vulnerables si no están encriptados adecuadamente.
  - **Compromiso de integridad de los datos**: Modificaciones maliciosas de los datos procesados, afectando la calidad de los análisis.
- **Impacto**: Si los datos son alterados o robados, las decisiones basadas en los análisis pueden ser incorrectas o inseguras.

**Ejemplo**: Un atacante compromete el sistema de procesamiento por lotes de una empresa de logística, obteniendo datos sobre rutas y horarios de entrega, lo que resulta en pérdida de confianza del cliente.

---

#### **Stream Processing (Procesamiento en tiempo real)**  
**Descripción del riesgo**:  
La naturaleza continua y en tiempo real de los flujos de datos aumenta la superficie de ataque.  
- **Ataques comunes**:  
  - **Inyección de datos falsos**: Alteración de los flujos para desinformar a los sistemas.
  - **Ataques de denegación de servicio (DoS)**: Sobrecarga de los sistemas de streaming con datos falsos o excesivos.
  - **Intercepción en tránsito**: Datos no cifrados en flujos son vulnerables a ser espiados o robados.
- **Impacto**: Interrupciones del sistema o decisiones automáticas incorrectas en base a datos manipulados.

**Ejemplo**: Una plataforma de pagos en tiempo real es atacada mediante inyección de datos falsos, causando bloqueos injustificados en cuentas de clientes.

---

#### **Arquitectura Lambda**  
**Descripción del riesgo**:  
La combinación de procesamiento por lotes y en tiempo real puede generar puntos vulnerables en ambos extremos.  
- **Ataques comunes**:  
  - **Errores de sincronización de datos**: Un atacante puede explotar inconsistencias entre los datos en tiempo real y los datos históricos para insertar información incorrecta.  
  - **Ataques persistentes**: Vulnerabilidades en el almacenamiento de datos históricos (procesamiento por lotes) pueden ser explotadas a largo plazo.  
  - **Superficie de ataque ampliada**: Las múltiples capas de la arquitectura incrementan las posibles vulnerabilidades.  
- **Impacto**: Información incoherente o manipulada que afecta tanto el análisis en tiempo real como los análisis históricos.

**Ejemplo**: Un sistema de monitoreo de dispositivos médicos basado en Lambda recibe datos falsificados en tiempo real, lo que genera alertas incorrectas y afecta los informes históricos.

---

#### **Arquitectura Kappa**  
**Descripción del riesgo**:  
La dependencia exclusiva del procesamiento en tiempo real incrementa los riesgos asociados con flujos continuos de datos.  
- **Ataques comunes**:  
  - **Fallas en la validación de datos**: La entrada de datos incorrectos no detectada puede propagarse rápidamente.  
  - **Sobrecarga de recursos**: Ataques de inyección de grandes volúmenes de datos para saturar el sistema.  
  - **Compromiso de nodos de procesamiento**: Los nodos individuales son objetivos fáciles para interrupciones.  
- **Impacto**: Interrupciones en los servicios críticos y posibles decisiones incorrectas basadas en datos manipulados.

**Ejemplo**: Un sistema de transporte autónomo basado en Kappa recibe datos de sensores falsificados, lo que provoca fallos en la planificación de rutas.

---

#### **Bases de Datos NoSQL**  
**Descripción del riesgo**:  
El diseño flexible y escalable de las bases NoSQL puede carecer de controles de seguridad rigurosos.  
- **Ataques comunes**:  
  - **Inyecciones NoSQL**: Similar a las inyecciones SQL, pero enfocadas en estructuras NoSQL.  
  - **Falta de cifrado**: Almacenamiento de datos sensibles sin medidas de encriptación.  
  - **Control de acceso débil**: Permisos mal configurados pueden permitir accesos no autorizados.  
- **Impacto**: Robo de datos, exposición pública de información confidencial y pérdida de confianza.

**Ejemplo**: Una base de datos NoSQL de una app de mensajería es comprometida, exponiendo conversaciones privadas de los usuarios.

---

#### **Data Lakes**  
**Descripción del riesgo**:  
El almacenamiento masivo y no estructurado en un Data Lake puede ser difícil de asegurar debido a su naturaleza abierta.  
- **Ataques comunes**:  
  - **Acceso no autorizado**: Falta de controles adecuados para datos no estructurados.  
  - **Fuga de datos sensibles**: Datos críticos que no están clasificados correctamente quedan expuestos.  
  - **Ataques de ransomware**: Encriptación maliciosa de todo el contenido del Data Lake.  
- **Impacto**: Pérdida de datos valiosos, interrupción de operaciones y daño reputacional.

**Ejemplo**: Un atacante explota una vulnerabilidad en el Data Lake de una empresa de seguros y accede a información confidencial de los clientes.

---

#### **Data Warehouses**  
**Descripción del riesgo**:  
El diseño estructurado y optimizado para consultas del Data Warehouse puede ser explotado si no se aseguran adecuadamente las interfaces y accesos.  
- **Ataques comunes**:  
  - **Exfiltración de consultas**: Robo de información mediante consultas malintencionadas.  
  - **Escalada de privilegios**: Usuarios malintencionados obtienen acceso administrativo.  
  - **Ataques de fuerza bruta**: Acceso no autorizado mediante intentos repetidos en sistemas de autenticación débiles.  
- **Impacto**: Robo de datos analíticos, manipulación de resultados y pérdida financiera.

**Ejemplo**: Un Data Warehouse de una aerolínea es comprometido, exponiendo datos sobre reservas y estrategias de precios.
______
Referencias arbitradas

- Kune, R., Konugurthi, P. K., Agarwal, A., Chillarige, R. R., & Buyya, R. (2016). The anatomy of big data computing. *Software: Practice and Experience, 46*(1), 79–105. https://doi.org/10.1002/spe.2374  

- Ghilic-Micu, B., Stoica, M., & Mircea, M. (2014). Big data security: Challenges, solutions, and open issues. *Database Systems Journal, 5*(1), 32–40. Retrieved from https://www.dbjournal.ro/  

- Damiani, E., & Zavatarelli, F. (2018). Securing big data: Security and privacy in Hadoop. In *Big Data Analytics: A Management Perspective* (pp. 161–181). Springer. https://doi.org/10.1007/978-3-319-97797-5_8  

- Chhabra, S., Patgiri, R., & Sharma, M. (2021). A survey on big data storage and security. *Journal of Computer Science, 17*(7), 605–622. https://doi.org/10.3844/jcssp.2021.605.622  

- Xiao, Z., & Xiao, Y. (2013). Security and privacy in cloud computing. *IEEE Communications Surveys & Tutorials, 15*(2), 843–859. https://doi.org/10.1109/SURV.2012.060912.00164  

______
> By CISO oswaldo.diaz@inegi.org.mx 