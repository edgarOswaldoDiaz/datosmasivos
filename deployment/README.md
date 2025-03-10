## Estrategia para conectar los contnedores utilizados en la plataforma
<img src="/assets/PaaS_and_Contenedores.jpg">

### **Procesos basados en Pipeline CI/CD**: 
- [GitLab CI/CD](https://docs.gitlab.com/ee/ci/) : Es una herramienta de integración y entrega continua (CI/CD) integrada en GitLab que permite la automatización de pruebas, compilación y despliegue de software.  
- [MLflow](https://mlflow.org/docs/latest/index.html) : Plataforma de gestión del ciclo de vida de modelos de aprendizaje automático (ML), que facilita el seguimiento de experimentos, gestión de modelos y despliegue en producción.

### **Acceso a datos (autenticación y autorización)**:
- [Keycloak](https://www.keycloak.org/) : Sistema de gestión de identidad y acceso (IAM) de código abierto que proporciona autenticación, autorización y administración de usuarios para aplicaciones y servicios.  
- [OpenMetadata](https://open-metadata.org/) : Plataforma de metadatos de código abierto para catalogar, gobernar y gestionar datos en entornos de análisis y ciencia de datos.  

### **Extracción, validación, carga de datos**:
- [Apache Spark](https://spark.apache.org/): : Motor de procesamiento distribuido para grandes volúmenes de datos, utilizado en análisis en tiempo real, aprendizaje automático y procesamiento ETL.  

### **Almacenamiento – Resguardo de datos**:
- [Minio S3](https://min.io/) : Solución de almacenamiento de objetos compatible con el protocolo Amazon S3, diseñada para entornos locales y en la nube con enfoque en alta disponibilidad y escalabilidad. 

### **Homologación, transformación de datos**:
- [Apache DBT](https://docs.getdbt.com/) (*Data Build Tool*): Herramienta que permite transformar datos en almacenes analíticos mediante SQL, facilitando la ingeniería de datos y modelado analítico.  
- [Apache Druid](https://druid.apache.org/) : Base de datos analítica de alto rendimiento diseñada para consultas rápidas sobre datos de series temporales y análisis en tiempo real.  

### **Integración de datos**:
- [Apache Trino](https://trino.io/) : Motor de consulta SQL distribuido que permite ejecutar análisis de datos en múltiples fuentes de datos, como bases de datos y lagos de datos.  
- [Apache AirFlow](https://airflow.apache.org/) : Plataforma de orquestación de flujos de trabajo que permite programar, monitorizar y gestionar tareas de procesamiento de datos.  

### **Analítica y ciencia de datos**:
- [Pytorch](https://pytorch.org/) : Biblioteca de aprendizaje profundo de código abierto que facilita la creación, entrenamiento e implementación de modelos de inteligencia artificial.  

### **Visualización de datos**:
- [Apache Superset](https://superset.apache.org/docs/intro) : Plataforma de visualización y exploración de datos que permite crear dashboards interactivos y análisis de datos con una interfaz gráfica amigable.  
- [Grafana](https://grafana.com/) : Herramienta de monitoreo y visualización de datos en tiempo real que permite crear dashboards personalizados a partir de diversas fuentes de datos.  
________________________________________
> By CISO oswaldo.diaz@inegi.org.mx 
