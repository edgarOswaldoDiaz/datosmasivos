# Plataforma como servicio (PaaS)
<img src="/assets/PaaS.jpg">

## Descripción de los componentes

- **Privacidad y seguridad de la información digital**: La privacidad y seguridad de la información digital se garantiza mediante la implementación de políticas y controles basados en estándares internacionales. Se prioriza la confidencialidad de los microdatos estadísticos y geográficos, incorporando técnicas como encriptación, anonimización y generación de datos sintéticos para proteger información sensible.

- **Interoperabilidad**: Se promueve la interoperabilidad para facilitar la integración de datos provenientes de diversas fuentes internas y externas, empleando estándares abiertos y formatos como XML, PARQUET, JSON y APIs RESTful. Esto permite que diferentes sistemas interactúen eficientemente con otras instituciones, organizaciones.

- **Grupo de trabajo especializado**: El proyecto requiere un grupo interdisciplinario compuesto por científicos de datos, ingenieros de procesos automatizados, especialistas en seguridad informática y administradores de datos. Este equipo se encargará de definir lineamientos técnicos y operativos para el gobierno de datos. 

- **Procesos basados en Pipeline CI/CD**:  Se implementan pipelines de Integración Continua/Entrega Continua (CI/CD) para automatizar procesos, garantizando la actualización eficiente y controlada de los servicios. Esto incluye pruebas automatizadas y revisión de seguridad en cada fase para minimizar riesgos operativos.Herramientas utilizadas: [GitLab CI/CD](https://docs.gitlab.com/ee/ci/), [GitHub Actions](https://docs.github.com/es/actions), [Jenkins](https://www.jenkins.io/), [MLflow](https://mlflow.org/docs/latest/index.html), entre otras.

- **Ingeniería de procesos (DevSecOps)**: El enfoque DevSecOps asegura que las prácticas de desarrollo, operaciones y seguridad estén integradas desde el inicio. Esto incluye escaneos de vulnerabilidades, revisiones de código seguro y cumplimiento normativo, asegurando que las herramientas y flujos del lago de datos sean resilientes y confiables.

- **Ingeniería de datos (DataSecOps)**: La implementación de DataSecOps combina prácticas de seguridad en la manipulación de datos, asegurando su gobernanza y calidad durante todo el ciclo de vida. Esto incluye la validación, limpieza, transformación y monitoreo continuo de los datos para preservar su integridad y confiabilidad.

- **Acceso a datos (autenticación y autorización)**: Se establecen mecanismos robustos de autenticación y autorización, como la autenticación multifactor (MFA) y roles de acceso basados en políticas (RBAC). Esto asegura que sólo usuarios y sistemas autorizados puedan acceder a los datos en función de su perfil y necesidades. Herramiantas utilizadas: [Apache Ranger](https://ranger.apache.org/), [Keycloak](https://www.keycloak.org/), [Apache Atlas](https://atlas.apache.org/#/), [OpenMetadata](https://open-metadata.org/), entre otras.

- **Extracción, validación, carga de datos**: Este proceso implica la recolección de datos desde diversas fuentes internas y externas. Durante la extracción, se identifican los conjuntos de datos relevantes; la validación garantiza que estos cumplan con estándares de integridad, precisión y formato. Posteriormente, se realiza la carga de los datos, asegurando que sean accesibles y utilicen los esquemas adecuados para su procesamiento futuro. Herramientas utilizadas: [Apache NiFi](https://nifi.apache.org/), [Apache Kafka](https://kafka.apache.org/), [Apache Spark](https://spark.apache.org/), [Apaches Dask](https://docs.dask.org/en/stable/), entre otras.

- **Almacenamiento – Resguardo de datos**: Los datos almacenados deben ser resguardados con tecnologías que aseguren su persistencia y disponibilidad. Esto incluye medidas de seguridad para proteger la confidencialidad estadística y prevenir accesos no autorizados, además de estrategias de backup y recuperación ante desastres para garantizar la continuidad operativa. Herramiantas utilizadas: [Minio S3](https://min.io/), [Apache HDFS](https://hadoop.apache.org/), entre otras. 

- **Homologación, transformación de datos**: Dado que los datos provienen de diferentes fuentes con formatos y estándares variados, es necesario homologarlos mediante la aplicación de criterios comunes. La transformación asegura que los datos sean adaptados al modelo requerido por el requerimiento, incluyendo cambios en estructuras, escalas y nomenclaturas para lograr consistencia y facilitar su uso. Herramientas utilizadas: [Apache Hive](https://hive.apache.org/), [Apache DBT](https://docs.getdbt.com/), [Apache Druid](https://druid.apache.org/), entre otras.

- **Integración de datos**: En esta etapa, los datos de distintas fuentes son combinados y relacionados en un esquema unificado, permitiendo la creación de vistas integrales para análisis. La integración debe cumplir con principios de interoperabilidad, respetando normas y estándares que permitan el cruce de información de manera coherente y eficiente. Herramientas utilizadas: [Apache Trino](https://trino.io/), [Apache AirFlow](https://airflow.apache.org/), entre otras.

- **Analítica y ciencia de datos**: Con los datos integrados y limpios, se desarrollan modelos analíticos y de ciencia de datos para extraer conocimiento útil. Esto incluye la aplicación de técnicas de minería de datos, aprendizaje automático y modelado estadístico, con el objetivo de apoyar la toma de decisiones en áreas clave como la calidad, seguridad y el gobierno de la información. Herramientas utilizadas: [MLib](https://spark.apache.org/mllib/), [Tensorflow](https://www.tensorflow.org/?hl=es-419), [Pytorch](https://pytorch.org/), entre otras. 

- **Visualización de datos**: Los resultados obtenidos de los análisis se presentan en formatos visuales accesibles como dashboards, gráficos y mapas interactivos. Estas herramientas facilitan la comprensión de la información por parte de usuarios no técnicos, promoviendo la transparencia y el aprovechamiento de los datos en la toma de decisiones estratégicas. Herramientas utilizadas: [Apache Superset](https://superset.apache.org/docs/intro), [Grafana](https://grafana.com/), [Apache Echart](https://echarts.apache.org/en/index.html), entre otras.

- **Plataforma de cómputo (On-premises y/o nube híbrida)**: Plataforma de cómputo flexible que puede ser on-premises, en la nube híbrida, o una combinación de ambas. Esto permite balancear necesidades de rendimiento, almacenamiento y regulación, optimizando costos mientras se asegura la confidencialidad, escalabilidad y disponibilidad de los datos.
________________________________________
> By CISO oswaldo.diaz@inegi.org.mx 

