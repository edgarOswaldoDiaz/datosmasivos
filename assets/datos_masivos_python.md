# Análisis de datos masivos con Python

Tabla que muestra las herramientas de Python para procesamiento de datos masivos

| **Categoría**                  | **Herramienta**         | **Características** |
|---------------------------------|------------------------|---------------------|
| **Manipulación de Datos**       | Pandas                 | Manejo de datos en DataFrames, operaciones eficientes en memoria. |
|                                 | Dask                   | Extensión de Pandas para procesamiento paralelo de grandes volúmenes de datos. |
|                                 | NumPy                  | Operaciones numéricas optimizadas, manejo de arreglos de gran tamaño. |
| **Procesamiento Distribuido**   | PySpark                | Procesamiento distribuido con Apache Spark, adecuado para Big Data. |
|                                 | Ray                    | Framework para computación distribuida en Python, útil en ML. |
|                                 | Modin                  | Alternativa a Pandas con ejecución en paralelo. |
| **Bases de Datos y Almacenamiento** | SQLAlchemy         | Conexión y manipulación de bases de datos SQL desde Python. |
|                                 | Pydoop                 | Interfaz para trabajar con Hadoop y HDFS desde Python. |
|                                 | DuckDB                 | Base de datos columnar optimizada para análisis en memoria. |
| **Visualización de Datos**      | Matplotlib             | Gráficos básicos y personalizables en 2D. |
|                                 | Seaborn                | Extensión de Matplotlib con visualizaciones avanzadas y estilizadas. |
|                                 | Plotly                 | Visualización interactiva de datos en 2D y 3D. |
|                                 | Datashader             | Visualización eficiente de grandes conjuntos de datos. |
| **Machine Learning y IA**       | Scikit-learn           | Modelos de clasificación, regresión y clustering para análisis de datos. |
|                                 | XGBoost                | Algoritmo de gradient boosting optimizado para grandes volúmenes de datos. |
|                                 | LightGBM               | Algoritmo de boosting rápido y eficiente para datos masivos. |
|                                 | TensorFlow             | Framework para Deep Learning y redes neuronales. |
|                                 | PyTorch                | Plataforma para IA con soporte en GPU y computación distribuida. |
| **Procesamiento en Tiempo Real** | Kafka-Python         | Integración con Apache Kafka para procesamiento de datos en streaming. |
|                                 | PyFlink                | API para procesamiento de datos en flujo con Apache Flink. |
|                                 | FastAPI                | Creación de APIs de alto rendimiento para servir modelos de análisis. |
| **Optimización y Paralelización** | Multiprocessing     | Soporte nativo de Python para ejecución en múltiples núcleos. |
|                                 | Threading              | Manejo de tareas concurrentes en Python. |
|                                 | Joblib                 | Ejecución en paralelo y optimización de cargas de trabajo en ML. |
| **Interpretabilidad y Evaluación de Modelos** | SHAP               | Interpretación de modelos de Machine Learning. |
|                                 | LIME                   | Explicabilidad de modelos de IA en predicciones individuales. |
|                                 | Optuna                 | Optimización automática de hiperparámetros en modelos de ML. |

Ejemplo de un código en PySpark para descarga de datos en la API - Rest 

Pyspark puede ayudar al procesamiento de datos masivos en tiempo real de una red social al permitir el manejo eficiente de grandes volúmenes de información mediante su capacidad de procesamiento distribuido. Con su integración con Apache Spark Streaming, Pyspark puede ingerir, transformar y analizar flujos continuos de datos (como publicaciones, comentarios o interacciones) en tiempo real, escalando horizontalmente en clústeres para garantizar un rendimiento óptimo incluso con cargas de trabajo crecientes. Esto facilita la detección de tendencias, la personalización de contenido y la toma de decisiones inmediatas basadas en datos actualizados.

* **API de X (Twitter):** Para acceder a la API de X, necesitarás obtener claves de API y tokens de acceso. Esto generalmente implica crear una cuenta de desarrollador en la plataforma X. Las políticas de acceso a la API de X pueden cambiar, por lo que es fundamental consultar la documentación oficial para obtener la información más actualizada.

```python
from pyspark.sql import SparkSession
import requests
import json

def descargar_datos_x(url, headers):
    """
    Función para descargar datos de la API de X.

    Args:
        url (str): URL de la API.
        headers (dict): Encabezados de la solicitud (incluyendo tokens de acceso).

    Returns:
        list: Lista de datos JSON descargados.
    """
    try:
        response = requests.get(url, headers=headers)
        response.raise_for_status()  # Lanza una excepción para códigos de error HTTP
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error al descargar datos: {e}")
        return None

def procesar_datos_spark(spark, datos):
    """
    Función para procesar datos JSON con PySpark.

    Args:
        spark (SparkSession): Sesión de Spark.
        datos (list): Lista de datos JSON.
    """
    if datos:
        # Convierte la lista de diccionarios JSON a un RDD
        rdd = spark.sparkContext.parallelize(datos)
        # Convierte el RDD a un DataFrame
        df = spark.read.json(rdd)
        # Realiza operaciones de procesamiento de datos (ejemplo: mostrar el esquema)
        df.printSchema()
        # Ejemplo de como guardar el Dataframe en formato parquet.
        df.write.parquet("datos_x.parquet")

if __name__ == "__main__":
    # Configuración de la sesión de Spark
    spark = SparkSession.builder.appName("DescargaDatosX").getOrCreate()
    # Configuración de la API de X (reemplaza con tus claves y tokens)
    url_api_x = "URL_DE_LA_API_DE_X"  # Ejemplo: "https://api.twitter.com/2/tweets/search/recent?query=pyspark"
    headers_api_x = {
        "Authorization": "Bearer TU_TOKEN_DE_ACCESO"
    }
    # Descarga de datos
    datos_descargados = descargar_datos_x(url_api_x, headers_api_x)
    # Procesamiento de datos con Spark
    procesar_datos_spark(spark, datos_descargados)
    # Detener la sesión de Spark
    spark.stop()
```

**Explicación paso a paso:**

- **Importación de librerías:**
    * `pyspark.sql.SparkSession`: Para crear una sesión de Spark.
    * `requests`: Para realizar solicitudes HTTP a la API.
    * `json`: Para trabajar con datos JSON.
- **Función `descargar_datos_x`:**
    * Toma la URL de la API y los encabezados de la solicitud como entrada.
    * Realiza una solicitud GET a la API.
    * Maneja posibles errores de solicitud.
    * Devuelve los datos JSON descargados.
- **Función `procesar_datos_spark`:**
    * Toma la sesión de Spark y los datos JSON como entrada.
    * Convierte los datos JSON a un RDD (Resilient Distributed Dataset).
    * Convierte el RDD a un DataFrame de Spark.
    * Realiza operaciones de procesamiento de datos, como imprimir el esquema del DataFrame.
    * Guarda los datos en formato parquet.
- **Bloque `if __name__ == "__main__":`:**
    * Crea una sesión de Spark.
    * Configura la URL y los encabezados de la API de X.
    * Llama a la función `descargar_datos_x` para descargar los datos.
    * Llama a la función `procesar_datos_spark` para procesar los datos con Spark.
    * Detiene la sesion de Spark.
____________________
> By CISO oswaldo.diaz@inegi.org.mx
