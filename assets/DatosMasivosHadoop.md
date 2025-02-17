# Arquitectura y gobierno de datos masivos general de Hadoop

El ecosistema de **Apache Hadoop** es una de las principales plataformas utilizadas para el procesamiento y análisis de **datos masivos (Big Data)**. Su diseño se basa en la capacidad de manejar grandes volúmenes de datos de manera distribuida, asegurando **alto rendimiento, escalabilidad y disponibilidad**. Para ello, Hadoop cuenta con una **pila funcional** compuesta por diferentes tecnologías que trabajan de manera integrada.  

**Componentes principales de la pila funcional de Hadoop**  

La arquitectura de Hadoop se basa en varios componentes clave que permiten el procesamiento de grandes volúmenes de datos de manera eficiente:  

- **Hadoop Distributed File System (HDFS):** Un sistema de archivos distribuido diseñado para almacenar grandes conjuntos de datos en múltiples nodos, asegurando tolerancia a fallos y accesibilidad.  
- **Yet Another Resource Negotiator (YARN):** Un gestor de recursos que optimiza la ejecución de tareas distribuidas en clústeres grandes.  
- **MapReduce:** Un modelo de programación que permite el procesamiento paralelo de grandes volúmenes de datos mediante la división en tareas de "map" y "reduce".  

**Tecnologías complementarias para alto rendimiento**  

Para mejorar el rendimiento y la disponibilidad del ecosistema Hadoop, se integran diversas herramientas y marcos de trabajo, tales como:  

- **Apache Hive:** Proporciona una interfaz similar a SQL para la consulta y análisis de datos almacenados en HDFS.  
- **Apache HBase:** Base de datos NoSQL que ofrece almacenamiento escalable para datos no estructurados y semiestructurados.  
- **Apache Spark:** Motor de procesamiento en memoria que mejora la velocidad del análisis de datos comparado con MapReduce.  
- **Apache Flink:** Plataforma para el procesamiento de flujos de datos en tiempo real.  
- **Apache Oozie:** Sistema de gestión y orquestación de flujos de trabajo para coordinar tareas en Hadoop.  

**Interoperabilidad en el ecosistema Hadoop**  

La interoperabilidad dentro del ecosistema Hadoop permite la integración con diversas plataformas y herramientas externas, facilitando la transferencia y el procesamiento eficiente de datos. Esto se logra mediante:  

- **Conectores y APIs:** Interfaces que permiten la comunicación con bases de datos relacionales, almacenes de datos en la nube y otros sistemas.  
- **Apache Sqoop:** Herramienta para la importación y exportación de datos entre Hadoop y bases de datos relacionales.  
- **Apache Kafka:** Plataforma de mensajería distribuida para la ingesta y transmisión de datos en tiempo real.  
- **Apache NiFi:** Solución para la automatización de flujos de datos y la integración entre diferentes fuentes.  

**Alta disponibilidad y tolerancia a fallos**  

Para garantizar la **alta disponibilidad** del ecosistema Hadoop, se implementan estrategias como:  

- **HDFS Replication:** Replica los bloques de datos en múltiples nodos para evitar la pérdida de información.  
- **YARN High Availability:** Mecanismo que permite la redundancia en el nodo de gestión de recursos.  
- **Hadoop NameNode High Availability:** Implementación de NameNodes secundarios para evitar puntos únicos de fallo.  
- **Apache Zookeeper:** Proporciona coordinación y sincronización de servicios distribuidos.  

- **Arquitectura y gobierno de datos masivos general de Hadoop**: El ecosistema de datos masivos ha transformado la manera en que las organizaciones almacenan, procesan y analizan grandes volúmenes de información. Dentro de este contexto, **Hadoop** se ha consolidado como una de las plataformas más utilizadas para gestionar datos a gran escala. Este tema proporciona una visión integral sobre la arquitectura y el gobierno de datos masivos, abordando sus fundamentos, fuentes de datos, almacenamiento, plataformas tecnológicas y mecanismos para garantizar la calidad, seguridad y privacidad de la información.  

- **Arquitectura de datos masivos**: Se exploran los principios fundamentales de la arquitectura de datos masivos, incluyendo los modelos de procesamiento distribuido, almacenamiento escalable y esquemas de integración de datos. Se analiza la arquitectura en capas, sus componentes principales y cómo estos permiten gestionar eficientemente grandes volúmenes de información.  

- **Fuentes y almacenes de datos**: Se estudian las diferentes fuentes de datos masivos, que pueden provenir de sistemas transaccionales, sensores IoT, redes sociales, logs de servidores, entre otros. También se abordan los distintos tipos de almacenes de datos, como almacenes estructurados, no estructurados y semiestructurados, y su papel en la gestión de datos a gran escala.  

- **Bases de datos**: Se presentan los modelos de bases de datos utilizados en entornos de datos masivos, diferenciando entre bases de datos relacionales (SQL) y NoSQL. Se analizan tecnologías como Apache HBase, Cassandra y MongoDB, evaluando sus ventajas y desventajas en escenarios de Big Data.  

- **Plataforma Hadoop**: Se profundiza en la plataforma **Apache Hadoop**, explicando su arquitectura y componentes clave, como el sistema de archivos distribuido **HDFS**, el modelo de procesamiento **MapReduce** y el gestor de recursos **YARN**. Además, se revisan herramientas complementarias del ecosistema Hadoop, como **Hive, Pig, Spark y Flink**, que facilitan la manipulación y análisis de datos.  

- **Analítica de datos masivos**: Se exploran las técnicas y herramientas de análisis de datos masivos, abordando métodos de procesamiento batch y en tiempo real. Se estudian tecnologías como **Apache Spark, Storm y Flink**, así como enfoques basados en aprendizaje automático y minería de datos.  

- **Gobierno de datos masivos**: Se analiza el concepto de **gobierno de datos** y su importancia en la gestión de datos masivos. Se abordan aspectos como la catalogación de datos, la gestión de metadatos, la trazabilidad de la información y la normativa regulatoria. Se exploran herramientas como **Apache Atlas y Collibra**.  

- **Calidad de datos masivos**: Se revisan los principios de calidad de datos en entornos de Big Data, abordando dimensiones clave como exactitud, consistencia, integridad y validez. Se presentan metodologías y herramientas para la limpieza, transformación y validación de datos masivos.  

- **Seguridad y privacidad**: Se estudian los desafíos de seguridad y privacidad en el manejo de grandes volúmenes de datos. Se abordan técnicas de **cifrado, control de accesos, anonimización y privacidad diferencial**, así como normativas de protección de datos como **GDPR y la Ley Federal de Protección de Datos Personales**.  

## Tabla con las principales características de **Hadoop** y sus componentes 

| **Característica**            | **Descripción** |
|-------------------------------|----------------|
| **Arquitectura distribuida**  | Hadoop se basa en una arquitectura distribuida que permite procesar y almacenar grandes volúmenes de datos en múltiples nodos de un clúster. |
| **Sistema de archivos HDFS**  | El **Hadoop Distributed File System (HDFS)** permite el almacenamiento de datos en bloques distribuidos a lo largo de varios nodos, asegurando redundancia y tolerancia a fallos. |
| **Procesamiento paralelo**    | Utiliza el modelo **MapReduce**, que divide las tareas en pequeñas unidades de trabajo que se ejecutan en paralelo en distintos nodos del clúster. |
| **Escalabilidad**            | Puede escalar horizontalmente agregando más nodos al clúster sin afectar el rendimiento ni la disponibilidad del sistema. |
| **Alta tolerancia a fallos** | Replica automáticamente los datos en varios nodos para evitar la pérdida de información en caso de fallos de hardware o software. |
| **Gestión de recursos con YARN** | **Yet Another Resource Negotiator (YARN)** administra los recursos del clúster y asigna tareas a los nodos de manera eficiente. |
| **Compatibilidad con distintos tipos de datos** | Soporta datos estructurados, semiestructurados y no estructurados provenientes de diversas fuentes como bases de datos, sensores IoT, redes sociales y logs de servidores. |
| **Ecosistema ampliable** | Cuenta con múltiples herramientas y tecnologías complementarias como **Hive** (consultas SQL), **Pig** (procesamiento de datos), **HBase** (base de datos NoSQL), **Spark** (procesamiento en memoria) y **Flink** (procesamiento en tiempo real). |
| **Código abierto** | Es un proyecto de código abierto bajo la **Apache Software Foundation**, lo que permite su adaptación y mejora por parte de la comunidad. |
| **Costo eficiente** | Reduce costos al permitir el uso de hardware común en lugar de sistemas de almacenamiento y procesamiento costosos. |
| **Integración con la nube** | Compatible con plataformas en la nube como **AWS, Azure y Google Cloud**, lo que facilita su implementación y escalabilidad sin necesidad de infraestructura propia. |
| **Seguridad y control de acceso** | Permite mecanismos de autenticación y autorización mediante **Kerberos**, cifrado de datos y control de accesos basados en roles. |

### Explicación de como habilitar contenedores para Hadoop

```yaml
version: "3.7"

services:
  namenode:
    image: bde2020/hadoop-namenode:latest
    container_name: namenode
    ports:
      - "50070:50070"
      - "8088:8088"
    environment:
      - CLUSTER_NAME=mycluster
    volumes:
      - namenode_data:/data
    networks:
      hadoop-network:
        aliases:
          - namenode

  datanode1:
    image: bde2020/hadoop-datanode:latest
    container_name: datanode1
    depends_on:
      - namenode
    environment:
      - CLUSTER_NAME=mycluster
    volumes:
      - datanode1_data:/data
    networks:
      hadoop-network:
        aliases:
          - datanode1

  datanode2:
    image: bde2020/hadoop-datanode:latest
    container_name: datanode2
    depends_on:
      - namenode
    environment:
      - CLUSTER_NAME=mycluster
    volumes:
      - datanode2_data:/data
    networks:
      hadoop-network:
        aliases:
          - datanode2

  resourcemanager:
    image: bde2020/hadoop-resourcemanager:latest
    container_name: resourcemanager
    depends_on:
      - namenode
      - datanode1
      - datanode2
    ports:
      - "8080:8080"
    environment:
      - CLUSTER_NAME=mycluster
    networks:
      hadoop-network:
        aliases:
          - resourcemanager

  nodemanager1:
    image: bde2020/hadoop-nodemanager:latest
    container_name: nodemanager1
    depends_on:
      - namenode
      - datanode1
      - datanode2
      - resourcemanager
    environment:
      - CLUSTER_NAME=mycluster
    networks:
      hadoop-network:
        aliases:
          - nodemanager1

  nodemanager2:
    image: bde2020/hadoop-nodemanager:latest
    container_name: nodemanager2
    depends_on:
      - namenode
      - datanode1
      - datanode2
      - resourcemanager
    environment:
      - CLUSTER_NAME=mycluster
    networks:
      hadoop-network:
        aliases:
          - nodemanager2

volumes:
  namenode_data:
  datanode1_data:
  datanode2_data:

networks:
  hadoop-network:
    driver: bridge
```

- **Versión del archivo**: Se especifica la versión 3.7 del formato docker-compose.
- **Servicios**: Se definen los siguientes servicios:
- **namenode**: El nodo maestro de HDFS.
- **datanode1 y datanode2**: Dos nodos de datos que almacenan los bloques de archivos.
- **resourcemanager**: El administrador de recursos de YARN.
- **nodemanager1 y nodemanager2**: Dos nodos que ejecutan las tareas de procesamiento.
- **Imágenes**: Se utilizan las imágenes de Docker de bde2020/hadoop-namenode, bde2020/hadoop-datanode, bde2020/hadoop-resourcemanager y bde2020/hadoop-nodemanager. Estas imágenes ya contienen Hadoop preinstalado y configurado.
- **Nombres de los contenedores**: Se asignan nombres descriptivos a cada contenedor.
- **Puertos**: Se exponen los puertos necesarios para acceder a las interfaces web de Hadoop y YARN.
- **Variables de entorno**: Se define la variable de entorno CLUSTER_NAME para especificar el nombre del clúster Hadoop.
- **Volúmenes**: Se crean volúmenes para persistir los datos de los nodos namenode y datanodes, de modo que no se pierdan al detener o eliminar los contenedores.
- **Redes**: Se crea una red llamada hadoop-network para que los contenedores puedan comunicarse entre sí. Se asignan alias a los contenedores para facilitar la comunicación entre ellos.
- **Dependencias**: Se definen las dependencias entre los servicios. Por ejemplo, los datanodes dependen del namenode y el resourcemanager depende de los datanodes y del namenode.
________________________
> By CISO oswaldo.diaz@inegi.org.mx 
