# Análisis de datos con SQL

El análisis de datos con **Structured Query Language (SQL)** es un enfoque fundamental para procesar, manipular y extraer conocimiento a partir de bases de datos estructuradas. En el contexto de **Datos Masivos**, SQL se adapta para trabajar con grandes volúmenes de información almacenados en bases de datos relacionales y sistemas distribuidos, permitiendo la consulta eficiente y escalable de datos.

#### **Importancia**  
SQL es el estándar para la gestión de bases de datos relacionales y se ha expandido a entornos de Big Data con tecnologías como **Apache Hive, Google BigQuery y Amazon Redshift**, que permiten consultas SQL sobre sistemas distribuidos. Su importancia en el análisis de datos masivos radica en:  
- Su capacidad de manipular grandes volúmenes de datos de manera estructurada.  
- Su compatibilidad con tecnologías de almacenamiento distribuido.  
- Su capacidad de optimización y ejecución eficiente de consultas.  
- Su facilidad de integración con herramientas de análisis e inteligencia artificial.  

Tabla que describe las **sentencias SQL más utilizadas** en el proceso de análisis de datos masivos

| **Sentencia SQL**       | **Propósito**                                                                 | **Ejemplo de Uso**                                                                 |
|--------------------------|-------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| **SELECT**              | Seleccionar columnas específicas de una tabla.                                | `SELECT nombre, edad FROM usuarios;`                                               |
| **FROM**                | Especificar la tabla de la cual se extraen los datos.                         | `SELECT * FROM ventas;`                                                            |
| **WHERE**               | Filtrar registros que cumplen una condición específica.                       | `SELECT * FROM empleados WHERE salario > 50000;`                                   |
| **GROUP BY**            | Agrupar datos basados en una o más columnas para aplicar funciones de agregación. | `SELECT departamento, AVG(salario) FROM empleados GROUP BY departamento;`          |
| **HAVING**              | Filtrar grupos basados en una condición (se usa después de `GROUP BY`).       | `SELECT departamento, AVG(salario) FROM empleados GROUP BY departamento HAVING AVG(salario) > 60000;` |
| **ORDER BY**            | Ordenar los resultados en orden ascendente (ASC) o descendente (DESC).        | `SELECT * FROM productos ORDER BY precio DESC;`                                    |
| **JOIN**                | Combinar filas de dos o más tablas basadas en una condición relacionada.       | `SELECT u.nombre, p.producto FROM usuarios u JOIN compras c ON u.id = c.usuario_id;` |
| **INNER JOIN**          | Retorna solo las filas que tienen coincidencias en ambas tablas.              | `SELECT u.nombre, c.fecha FROM usuarios u INNER JOIN compras c ON u.id = c.usuario_id;` |
| **LEFT JOIN**           | Retorna todas las filas de la tabla izquierda y las coincidencias de la derecha. | `SELECT u.nombre, c.fecha FROM usuarios u LEFT JOIN compras c ON u.id = c.usuario_id;` |
| **RIGHT JOIN**          | Retorna todas las filas de la tabla derecha y las coincidencias de la izquierda. | `SELECT u.nombre, c.fecha FROM usuarios u RIGHT JOIN compras c ON u.id = c.usuario_id;` |
| **FULL JOIN**           | Retorna todas las filas cuando hay una coincidencia en cualquiera de las tablas. | `SELECT u.nombre, c.fecha FROM usuarios u FULL JOIN compras c ON u.id = c.usuario_id;` |
| **UNION**               | Combinar los resultados de dos o más consultas en un solo conjunto de resultados. | `SELECT nombre FROM clientes UNION SELECT nombre FROM proveedores;`                |
| **DISTINCT**            | Eliminar duplicados en los resultados de una consulta.                        | `SELECT DISTINCT ciudad FROM clientes;`                                             |
| **COUNT()**             | Contar el número de filas que coinciden con una condición.                     | `SELECT COUNT(*) FROM empleados WHERE departamento = 'Ventas';`                     |
| **SUM()**               | Calcular la suma de los valores en una columna.                                | `SELECT SUM(ventas) FROM ventas_anuales;`                                           |
| **AVG()**               | Calcular el promedio de los valores en una columna.                            | `SELECT AVG(salario) FROM empleados;`                                               |
| **MIN()**               | Encontrar el valor mínimo en una columna.                                      | `SELECT MIN(precio) FROM productos;`                                                |
| **MAX()**               | Encontrar el valor máximo en una columna.                                      | `SELECT MAX(precio) FROM productos;`                                                |
| **CASE**                | Realizar operaciones condicionales en una consulta.                            | `SELECT nombre, CASE WHEN edad < 18 THEN 'Menor' ELSE 'Adulto' END AS categoria FROM usuarios;` |
| **SUBQUERY**            | Anidar una consulta dentro de otra para realizar análisis más complejos.       | `SELECT nombre FROM usuarios WHERE id IN (SELECT usuario_id FROM compras);`         |
| **WINDOW FUNCTIONS**    | Realizar cálculos sobre un conjunto de filas relacionadas (filas "ventana").   | `SELECT nombre, salario, RANK() OVER (ORDER BY salario DESC) AS ranking FROM empleados;` |
| **LIMIT**               | Limitar el número de filas retornadas por una consulta.                        | `SELECT * FROM productos LIMIT 10;`                                                 |
| **OFFSET**              | Saltar un número específico de filas antes de retornar resultados.             | `SELECT * FROM productos LIMIT 10 OFFSET 20;`                                       |
| **CREATE TABLE**        | Crear una nueva tabla en la base de datos.                                     | `CREATE TABLE empleados (id INT, nombre VARCHAR(50), salario FLOAT);`               |
| **INSERT INTO**         | Insertar nuevos registros en una tabla.                                        | `INSERT INTO empleados (id, nombre, salario) VALUES (1, 'Juan', 50000);`            |
| **UPDATE**              | Modificar registros existentes en una tabla.                                   | `UPDATE empleados SET salario = 55000 WHERE id = 1;`                                |
| **DELETE**              | Eliminar registros de una tabla.                                               | `DELETE FROM empleados WHERE id = 1;`                                               |
| **ALTER TABLE**         | Modificar la estructura de una tabla (agregar, eliminar o modificar columnas). | `ALTER TABLE empleados ADD COLUMN departamento VARCHAR(50);`                        |
| **DROP TABLE**          | Eliminar una tabla de la base de datos.                                        | `DROP TABLE empleados;`                                                             |

## Ejemplo de análisis de sentimiento 

Para analizar el sentimiento de los datos descargados de la API de Twitter (ahora conocido como "X"), primero necesitamos entender que el análisis de sentimiento implica clasificar el contenido de los tweets en categorías como **positivo**, **negativo** o **neutral**. A continuación, te proporciono un ejemplo de cómo podrías estructurar y realizar consultas SQL sobre estos datos, asumiendo que los tweets se han almacenado en una base de datos relacional.

#### **Estructura de la Base de Datos**
Supongamos que tienes una tabla llamada `tweets` con la siguiente estructura:

| **Columna**       | **Tipo de Dato** | **Descripción**                                      |
|--------------------|------------------|------------------------------------------------------|
| `tweet_id`        | BIGINT           | Identificador único del tweet.                      |
| `usuario`         | VARCHAR(50)      | Nombre de usuario que publicó el tweet.             |
| `texto`           | TEXT             | Contenido del tweet.                                |
| `fecha`           | DATETIME         | Fecha y hora de publicación del tweet.             |
| `sentimiento`     | VARCHAR(10)      | Sentimiento del tweet (positivo, negativo, neutral).|

---

#### **Ejemplo de Consultas SQL**

#### **Conteo de Tweets por Sentimiento**
Esta consulta cuenta cuántos tweets hay en cada categoría de sentimiento.

```sql
SELECT sentimiento, COUNT(*) AS cantidad
FROM tweets
GROUP BY sentimiento;
```

**Resultado esperado:**
| sentimiento | cantidad |
|-------------|----------|
| positivo    | 150      |
| negativo    | 75       |
| neutral     | 275      |

---

#### **Tweets Negativos con Palabras Clave**
Esta consulta filtra los tweets negativos que contienen palabras clave como "problema" o "error".

```sql
SELECT tweet_id, usuario, texto, fecha
FROM tweets
WHERE sentimiento = 'negativo'
  AND (texto LIKE '%problema%' OR texto LIKE '%error%');
```

**Resultado esperado:**
| tweet_id | usuario      | texto                                      | fecha                |
|----------|--------------|--------------------------------------------|----------------------|
| 12345    | usuario1     | "Hay un problema con el servicio."         | 2023-10-01 12:34:56 |
| 67890    | usuario2     | "Error en la aplicación, no funciona."     | 2023-10-02 14:20:10 |

---

#### **Tweets Positivos de un Usuario Específico**
Esta consulta recupera los tweets positivos publicados por un usuario en particular.

```sql
SELECT tweet_id, texto, fecha
FROM tweets
WHERE usuario = 'usuario_famoso'
  AND sentimiento = 'positivo';
```

**Resultado esperado:**
| tweet_id | texto                                      | fecha                |
|----------|--------------------------------------------|----------------------|
| 54321    | "¡Me encanta este nuevo producto!"         | 2023-10-03 09:15:22 |
| 98765    | "Increíble experiencia, lo recomiendo."    | 2023-10-04 18:45:30 |

---

#### **Distribución de Sentimientos por Día**
Esta consulta agrupa los tweets por día y cuenta cuántos tweets hay en cada categoría de sentimiento.

```sql
SELECT DATE(fecha) AS dia, sentimiento, COUNT(*) AS cantidad
FROM tweets
GROUP BY dia, sentimiento
ORDER BY dia;
```

**Resultado esperado:**
| dia         | sentimiento | cantidad |
|-------------|-------------|----------|
| 2023-10-01  | positivo    | 50       |
| 2023-10-01  | negativo    | 20       |
| 2023-10-01  | neutral     | 80       |
| 2023-10-02  | positivo    | 60       |
| 2023-10-02  | negativo    | 30       |

---

#### **Tweets con Mayor Engagement (Likes y Retweets)**
Supongamos que tienes una columna adicional llamada `likes` y otra llamada `retweets`. Esta consulta recupera los tweets más populares.

```sql
SELECT tweet_id, usuario, texto, likes, retweets
FROM tweets
ORDER BY likes DESC, retweets DESC
LIMIT 10;
```

**Resultado esperado:**
| tweet_id | usuario      | texto                                      | likes | retweets |
|----------|--------------|--------------------------------------------|-------|----------|
| 11111    | usuario1     | "¡Feliz cumpleaños a mí!"                  | 1000  | 500      |
| 22222    | usuario2     | "Nuevo lanzamiento increíble."             | 950   | 450      |

---

#### **Análisis de Sentimiento por Usuario**
Esta consulta calcula el porcentaje de tweets positivos, negativos y neutrales para cada usuario.

```sql
SELECT usuario,
       COUNT(*) AS total_tweets,
       SUM(CASE WHEN sentimiento = 'positivo' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS porcentaje_positivo,
       SUM(CASE WHEN sentimiento = 'negativo' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS porcentaje_negativo,
       SUM(CASE WHEN sentimiento = 'neutral' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS porcentaje_neutral
FROM tweets
GROUP BY usuario;
```

**Resultado esperado:**
| usuario      | total_tweets | porcentaje_positivo | porcentaje_negativo | porcentaje_neutral |
|--------------|--------------|---------------------|---------------------|--------------------|
| usuario1     | 100          | 60.0                | 20.0                | 20.0               |
| usuario2     | 200          | 40.0                | 30.0                | 30.0               |

---

#### **Tendencias de Sentimiento en el Tiempo**
Esta consulta muestra cómo ha evolucionado el sentimiento a lo largo del tiempo.

```sql
SELECT DATE(fecha) AS dia,
       SUM(CASE WHEN sentimiento = 'positivo' THEN 1 ELSE 0 END) AS positivos,
       SUM(CASE WHEN sentimiento = 'negativo' THEN 1 ELSE 0 END) AS negativos,
       SUM(CASE WHEN sentimiento = 'neutral' THEN 1 ELSE 0 END) AS neutrales
FROM tweets
GROUP BY dia
ORDER BY dia;
```

**Resultado esperado:**
| dia         | positivos | negativos | neutrales |
|-------------|-----------|-----------|-----------|
| 2023-10-01  | 50        | 20        | 80        |
| 2023-10-02  | 60        | 30        | 90        |

---

### **Notas:**
- Para realizar el análisis de sentimiento, es común utilizar herramientas de **Procesamiento de Lenguaje Natural (NLP)** como **TextBlob**, **VADER**, o modelos de machine learning entrenados previamente.
- Los resultados del análisis de sentimiento se almacenan en la columna `sentimiento` para facilitar consultas posteriores.
- En un entorno de Big Data, estas consultas podrían ejecutarse en sistemas como **Spark SQL** o **Google BigQuery** para manejar grandes volúmenes de datos.

______________
> By CISO oswaldo.diaz@inegi.org.mx