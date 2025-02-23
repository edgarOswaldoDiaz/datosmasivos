# Análisis de datos masivos 

**Introducción al Ambiente de Ejecución de Hadoop: YARN, TEZ y SPARK**

En el ecosistema de Big Data, el procesamiento eficiente de grandes volúmenes de información es un desafío crítico. Hadoop, una de las plataformas más utilizadas para este propósito, ha evolucionado significativamente desde su creación, no solo en términos de almacenamiento distribuido (HDFS), sino también en la gestión y ejecución de tareas de procesamiento de datos. En este contexto, YARN (Yet Another Resource Negotiator), TEZ y SPARK han surgido como componentes clave para optimizar el rendimiento y la escalabilidad de las aplicaciones en entornos distribuidos.

YARN, introducido en Hadoop 2.0, actúa como el gestor de recursos y planificador de tareas, permitiendo que múltiples motores de procesamiento, como MapReduce, TEZ y SPARK, coexistan y compartan recursos de manera eficiente. Por su parte, TEZ es un framework de ejecución diseñado para mejorar el rendimiento de las tareas de procesamiento de datos al optimizar el flujo de trabajo y reducir la sobrecarga asociada con las operaciones de E/S. Finalmente, SPARK, conocido por su velocidad y facilidad de uso, ofrece un motor de procesamiento en memoria que permite ejecutar tareas analíticas complejas de manera más rápida que los enfoques tradicionales basados en disco.

En conjunto, estos componentes forman un ambiente de ejecución robusto y flexible que permite a las organizaciones abordar desafíos de Big Data de manera más eficiente. Esta introducción explora las características, ventajas y casos de uso de YARN, TEZ y SPARK, destacando su papel fundamental en el procesamiento distribuido moderno.

### Ambiente de ejecución de Hadoop

Tabla que muestra las características de **YARN, TEZ y SPARK**:

| Característica  | YARN (Yet Another Resource Negotiator) | TEZ | SPARK |
|---------------|--------------------------------------|------|-------|
| **Propósito** | Administrador de recursos y planificador de tareas en Hadoop. | Motor de ejecución optimizado para flujos de datos en Hadoop. | Motor de procesamiento distribuido en memoria para Big Data. |
| **Modelo de procesamiento** | Basado en contenedores y recursos en clústeres Hadoop. | DAG (Directed Acyclic Graph) optimizado para flujos de datos. | DAG, con procesamiento en memoria para mayor velocidad. |
| **Velocidad** | Lento en comparación con Spark, ya que usa MapReduce. | Más rápido que MapReduce, pero depende de la arquitectura Hadoop. | Mucho más rápido debido a su procesamiento en memoria. |
| **Uso de memoria** | Basado en disco (HDFS), lo que puede generar latencias. | Mejora el uso de memoria respecto a MapReduce, pero depende de HDFS. | Utiliza procesamiento en memoria, reduciendo I/O en disco. |
| **Integración con Hadoop** | Es el gestor de recursos de Hadoop (Hadoop 2 en adelante). | Se ejecuta sobre YARN y reemplaza MapReduce en Hadoop. | Se puede ejecutar sobre YARN, pero también de forma independiente. |
| **Tolerancia a fallos** | Alta, ya que maneja la distribución de recursos. | Depende de Hadoop, puede reintentar tareas fallidas. | Alta, con mecanismos de recuperación y replicación en RDDs. |
| **Lenguajes soportados** | Compatible con cualquier framework de Hadoop. | Java, Hive, Pig. | Scala, Java, Python, R, SQL. |
| **Casos de uso** | Gestión de recursos en clústeres de Hadoop. | Procesamiento eficiente de consultas en Hive y Pig. | Análisis en tiempo real, Machine Learning, procesamiento ETL. |

**Observaciones**
- **YARN** es un administrador de recursos que permite a otros motores (como TEZ y SPARK) ejecutar tareas de procesamiento de datos en Hadoop.
- **TEZ** es una mejora sobre MapReduce para optimizar flujos de datos en Hadoop.
- **SPARK** es un motor de procesamiento en memoria que supera en velocidad a TEZ y MapReduce, con soporte para múltiples lenguajes y casos de uso más diversos.

Ejemplo para habilitar contenedores 


```yaml
version: "3.8"

services:
  namenode:
    image: bde2020/hadoop-namenode:2.0.0-hadoop3.3.6-java11
    container_name: namenode
    ports:
      - "9870:9870"
    volumes:
      - namenode_data:/hadoop/dfs/name
    environment:
      - CLUSTER_NAME=test
    networks:
      - hadoop-network

  datanode:
    image: bde2020/hadoop-datanode:2.0.0-hadoop3.3.6-java11
    container_name: datanode
    depends_on:
      - namenode
    volumes:
      - datanode_data:/hadoop/dfs/data
    environment:
      - CLUSTER_NAME=test
    ports:
      - "9864:9864"
    networks:
      - hadoop-network

  resourcemanager:
    image: bde2020/hadoop-resourcemanager:2.0.0-hadoop3.3.6-java11
    container_name: resourcemanager
    depends_on:
      - namenode
      - datanode
    ports:
      - "8088:8088"
    environment:
      - CLUSTER_NAME=test
    networks:
      - hadoop-network

  nodemanager:
    image: bde2020/hadoop-nodemanager:2.0.0-hadoop3.3.6-java11
    container_name: nodemanager
    depends_on:
      - namenode
      - datanode
      - resourcemanager
    environment:
      - CLUSTER_NAME=test
    networks:
      - hadoop-network

  historyserver:
    image: bde2020/hadoop-historyserver:2.0.0-hadoop3.3.6-java11
    container_name: historyserver
    depends_on:
      - namenode
      - datanode
      - resourcemanager
    ports:
      - "8188:8188"
    environment:
      - CLUSTER_NAME=test
    networks:
      - hadoop-network

  spark-master:
    image: bitnami/spark:latest
    container_name: spark-master
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
      - spark_data:/opt/bitnami/spark
    networks:
      - hadoop-network

  spark-worker:
    image: bitnami/spark:latest
    container_name: spark-worker
    depends_on:
      - spark-master
    ports:
      - "8081:8081"
    environment:
      - SPARK_MODE=worker
      - SPARK_MASTER_URL=spark://spark-master:7077
      - SPARK_WORKER_MEMORY=1G
      - SPARK_WORKER_CORES=1
      - SPARK_RPC_AUTHENTICATION_ENABLED=no
      - SPARK_RPC_ENCRYPTION_ENABLED=no
      - SPARK_LOCAL_STORAGE_ENCRYPTION_ENABLED=no
      - SPARK_SSL_ENABLED=no
    volumes:
      - spark_data:/opt/bitnami/spark
    networks:
      - hadoop-network
  
  tez:
    image: apache/tez:latest
    container_name: tez
    depends_on:
      - namenode
      - datanode
      - resourcemanager
    environment:
      - YARN_RESOURCEMANAGER_HOSTNAME=resourcemanager
    volumes:
      - tez_data:/opt/tez
    networks:
      - hadoop-network

networks:
  hadoop-network:
    driver: bridge

volumes:
  namenode_data:
  datanode_data:
  spark_data:
  tez_data:
```

**Explicación de los servicios:**

- **namenode, datanode, resourcemanager, nodemanager, historyserver:** Estos servicios conforman el clúster Hadoop YARN. Se utilizan imágenes de `bde2020` que proporcionan configuraciones predefinidas para Hadoop.
- **spark-master, spark-worker:** Estos servicios configuran un clúster Spark. Se utiliza la imagen `bitnami/spark` para obtener la última versión de Spark.
- **tez:** Este servicio configura Tez. Se utiliza la imagen `apache/tez` para obtener la última versión de Tez.

- **Versiones:** Las imágenes utilizadas (`bde2020`, `bitnami/spark`, `apache/tez`) están configuradas para usar las últimas versiones disponibles en el momento de su creación. Verificar las imágenes y sus etiquetas para confirmar que estás utilizando las versiones deseadas.
- **Recursos:** Los recursos asignados a los contenedores (memoria, CPU) son ejemplos básicos. Ajustar estos valores según los recursos disponibles en tu sistema y las necesidades de tus cargas de trabajo.
- **Redes:** Se utiliza una red `hadoop-network` para permitir la comunicación entre los contenedores.
- **Volúmenes:** Se utilizan volúmenes para persistir los datos de Hadoop y Spark.
_____________
> By CISO oswaldo.diaz@inegi.org.mx
