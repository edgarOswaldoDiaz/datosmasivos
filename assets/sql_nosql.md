# Integración de conjunto de datos SQL y NoSQL

La integración de bases de datos SQL y NoSQL en un proyecto de análisis de datos masivos es una estrategia clave para combinar las fortalezas de ambos tipos de almacenamiento y ofrecer un sistema híbrido que facilite la consulta, transformación y análisis de grandes volúmenes de datos estructurados y no estructurados.  

### **Bases de Datos SQL** (Relacionales)  
- Basadas en un esquema fijo con estructura tabular.  
- Utilizan SQL como lenguaje de consulta estándar.  
- Garantizan ACID (Atomicidad, Consistencia, Aislamiento y Durabilidad).  
- Son ideales para transacciones financieras, reportes estructurados y datos que requieren integridad referencial.  

Ejemplos: **PostgreSQL, MySQL, SQL Server, Oracle Database**.  

### **Bases de Datos NoSQL** (No Relacionales)  
- Permiten mayor flexibilidad en la estructura de datos.  
- Existen diferentes modelos (documentos, clave-valor, grafos y columnas).  
- Escalan de manera horizontal y son eficientes para grandes volúmenes de datos no estructurados.  
- Son ideales para análisis en tiempo real, procesamiento de eventos y datos semiestructurados.  

Ejemplos: **MongoDB (documentos), Cassandra (columnas), Redis (clave-valor), Neo4j (grafos)**.  

### **Caracteristicas**  

| Característica        | SQL (Relacional) | NoSQL (No Relacional) |
|----------------------|-----------------|------------------|
| **Modelo de Datos**  | Basado en tablas con filas y columnas. | Modelos flexibles: documentos, clave-valor, columnas o grafos. |
| **Esquema** | Fijo y definido previamente. | Flexible y dinámico. |
| **Escalabilidad** | Escala **verticalmente** (más CPU/RAM en un solo servidor). | Escala **horizontalmente** (añadiendo más servidores). |
| **Consistencia** | Alta consistencia garantizada por ACID. | Dependiendo del modelo, pueden usar CAP (Consistencia, Disponibilidad, Partición). |
| **Tipo de Datos** | Estructurados y altamente organizados. | Semiestructurados o no estructurados (JSON, BSON, XML, etc.). |
| **Casos de Uso** | Transacciones financieras, reportes estructurados, CRM, ERP. | Redes sociales, Big Data, IoT, análisis en tiempo real. |
| **Lenguaje de Consulta** | SQL (Structured Query Language). | Depende de la base de datos (MongoDB Query, CQL, etc.). |
| **Velocidad de Lectura/Escritura** | Más lento en grandes volúmenes debido a la normalización. | Más rápido en escrituras y consultas masivas. |
| **Ejemplos de Bases de Datos** | PostgreSQL, MySQL, SQL Server, Oracle. | MongoDB, Cassandra, Redis, Neo4j, CouchDB. |

### **Herramientas**  

| Área de Implementación | Herramientas SQL | Herramientas NoSQL | Herramientas de Integración |
|----------------------|-----------------|------------------|------------------|
| **Almacenamiento de Datos** | PostgreSQL, MySQL, Snowflake, BigQuery | MongoDB, Cassandra, DynamoDB, HBase | Data Lakes (Amazon S3, Google Cloud Storage, Hadoop HDFS) |
| **Procesamiento de Datos** | Apache Hive, Spark SQL, Trino (PrestoSQL) | Apache Spark, Apache Flink | Airflow, Talend, Apache NiFi |
| **Ingesta de Datos** | SQL Server Integration Services (SSIS), Pentaho | Kafka, Apache Pulsar | Apache Beam, AWS Glue |
| **Análisis y Visualización** | Power BI, Tableau, Looker | ElasticSearch + Kibana, Grafana | Apache Superset, Metabase |
| **Machine Learning** | BigQuery ML, MLflow | TensorFlow, PyTorch | Databricks, Amazon SageMaker |
| **Monitoreo y Observabilidad** | SQL Profiler, pgAdmin | Prometheus, Grafana | OpenTelemetry, ELK Stack |

### **Nota:**  
Para un proyecto de análisis de datos masivos, lo ideal es combinar bases de datos SQL y NoSQL según los requisitos del negocio. SQL es ideal para datos estructurados y consultas analíticas, mientras que NoSQL es óptimo para datos no estructurados y escalabilidad en tiempo real. Integrar ambas tecnologías mediante Data Lakes y herramientas de orquestación permite un flujo de trabajo eficiente y flexible.

Ejemplo de como habilitar contenedores para procesos de tipo "SQL"

```yaml
version: "3.8"

services:
  postgres:
    image: postgres:14
    environment:
      POSTGRES_USER: myuser
      POSTGRES_PASSWORD: mypassword
      POSTGRES_DB: mydb
    ports:
      - "5432:5432"
    volumes:
      - postgres-data:/var/lib/postgresql/data

  hive-metastore:
    image: apache/hive:3.1.2
    command: /opt/hive/bin/schematool -initSchema -dbType postgres
    environment:
      SERVICE_NAME: metastore
      HIVE_CORE_CONF_javax_jdo_option_ConnectionURL: jdbc:postgresql://postgres:5432/mydb
      HIVE_CORE_CONF_javax_jdo_option_ConnectionDriverName: org.postgresql.Driver
      HIVE_CORE_CONF_javax_jdo_option_ConnectionUserName: myuser
      HIVE_CORE_CONF_javax_jdo_option_ConnectionPassword: mypassword
    ports:
      - "9083:9083"
    depends_on:
      - postgres

  hive-server:
    image: apache/hive:3.1.2
    command: /opt/hive/bin/hiveserver2
    environment:
      SERVICE_NAME: hiveserver2
      HIVE_METASTORE_URIS: thrift://hive-metastore:9083
    ports:
      - "10000:10000"
    depends_on:
      - hive-metastore

  spark-sql:
    image: apache/spark:3.2.1
    command: start-thriftserver.sh --hiveconf hive.server2.thrift.port=10001
    ports:
      - "10001:10001"
    environment:
      HIVE_METASTORE_URIS: thrift://hive-metastore:9083
    depends_on:
      - hive-metastore

  trino:
    image: trinodb/trino:latest
    ports:
      - "8080:8080"
    volumes:
      - ./trino-config:/etc/trino
    depends_on:
      - hive-metastore

  mlflow:
    image: mlflow:latest
    ports:
      - "5000:5000"
    volumes:
      - mlflow-artifacts:/mlflow/artifacts
    environment:
      MLFLOW_TRACKING_URI: http://mlflow:5000
    depends_on:
      - postgres

  pgadmin:
    image: dpage/pgadmin4:latest
    ports:
      - "5050:80"
    environment:
      PGADMIN_DEFAULT_EMAIL: admin@example.com
      PGADMIN_DEFAULT_PASSWORD: admin
    volumes:
      - pgadmin-data:/var/lib/pgadmin
    depends_on:
      - postgres

volumes:
  postgres-data:
  mlflow-artifacts:
  pgadmin-data:
```


**Configuración de Trino:**

Crear un directorio `trino-config` con los siguientes archivos de configuración:

* `config.properties`:

```properties
coordinator=true
http-server.http.port=8080
discovery.uri=http://trino:8080
```

* `catalog/hive.properties`:

```properties
connector.name=hive
hive.metastore.uri=thrift://hive-metastore:9083
```

* `catalog/postgresql.properties`:

```properties
connector.name=postgresql
connection-url=jdbc:postgresql://postgres:5432/mydb
connection-user=myuser
connection-password=mypassword
```

**Notas:**

- Las versiones de las imagenes pueden cambiar, por lo que te recomiendo revisar las ultimas versiones disponibles en dockerhub.
- Es necesario tener los puertos 5432, 9083, 10000, 10001, 8080, 5000 y 5050 disponibles.
- Para conectarte a pgAdmin, abre un navegador y ve a `http://localhost:5050`.


Ejemplo de como habilitar contenedores para procesos de tipo "NoSQL"

```yaml
version: "3.8"

services:
  mongodb:
    image: mongo:latest
    ports:
      - "27017:27017"
    volumes:
      - mongodb_data:/data/db
    networks:
      - mynetwork

  cassandra:
    image: cassandra:latest
    ports:
      - "9042:9042"
    environment:
      CASSANDRA_START_RPC: "true"
    volumes:
      - cassandra_data:/var/lib/cassandra
    networks:
      - mynetwork

  hbase:
    image: harisekhon/hbase:latest
    ports:
      - "16010:16010"
      - "16030:16030"
      - "16020:16020"
      - "2181:2181"
    environment:
      HBASE_CONF_hbase_unsafe_stream_replay: "true"
    volumes:
      - hbase_data:/opt/hbase/data
    networks:
      - mynetwork

  zookeeper:
    image: confluentinc/cp-zookeeper:latest
    environment:
      ZOOKEEPER_CLIENT_PORT: 2181
      ZOOKEEPER_TICK_TIME: 2000
    networks:
      - mynetwork

  kafka:
    image: confluentinc/cp-kafka:latest
    depends_on:
      - zookeeper
    ports:
      - "9092:9092"
    environment:
      KAFKA_BROKER_ID: 1
      KAFKA_ZOOKEEPER_CONNECT: zookeeper:2181
      KAFKA_ADVERTISED_LISTENERS: PLAINTEXT://kafka:9092,PLAINTEXT_HOST://localhost:9092
      KAFKA_LISTENER_SECURITY_PROTOCOL_MAP: PLAINTEXT:PLAINTEXT,PLAINTEXT_HOST:PLAINTEXT
      KAFKA_INTER_BROKER_LISTENER_NAME: PLAINTEXT
      KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR: 1
      KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR: 1
      KAFKA_TRANSACTION_STATE_LOG_MIN_ISR: 1
    networks:
      - mynetwork

  spark:
    image: bitnami/spark:latest
    depends_on:
      - kafka
      - mongodb
      - cassandra
      - hbase
    ports:
      - "8080:8080"
      - "7077:7077"
    environment:
      - SPARK_MODE=master
      - SPARK_RPC_AUTHENTICATION_ENABLED=no
      - SPARK_RPC_ENCRYPTION_ENABLED=no
      - SPARK_LOCAL_STORAGE_ENCRYPTION_ENABLED=no
      - SPARK_SSL_ENABLED=no
    volumes:
      - ./spark-data:/opt/bitnami/spark/data
    networks:
      - mynetwork

  flink:
    image: bitnami/flink:latest
    depends_on:
      - kafka
      - mongodb
      - cassandra
      - hbase
    ports:
      - "8081:8081"
    environment:
      - FLINK_MODE=jobmanager
      - JOB_MANAGER_RPC_ADDRESS=flink
    volumes:
      - ./flink-data:/opt/bitnami/flink/data
    networks:
      - mynetwork

networks:
  mynetwork:
    driver: bridge

volumes:
  mongodb_data:
  cassandra_data:
  hbase_data:
```

**Consideraciones Adicionales**

* Esta configuración es adecuada para un entorno de desarrollo. En un entorno de producción, se requerirían configuraciones más robustas, como la habilitación de la autenticación y el cifrado, la configuración de la alta disponibilidad y la gestión de los recursos.
* En esta configuración se utiliza una sola instancia de cada componente, para un entorno de producción,

________________
> By CISO oswaldo.diaz@inegi.org.mx
