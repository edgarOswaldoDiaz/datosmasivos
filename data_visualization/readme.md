# Visualizacion de grafos

## Uso
1. Clonar el repositorio

2. Instalar Docker si aún no se tiene instalado (https://www.docker.com/products/docker-desktop/)

3. En la carpeta de visualizacion_grafos construir la imagen de docker
```bash
# Correr en terminal para construir la imagen de docker
docker build -t graph-viewer .
```

4. Ejecutar el contenedor
```bash
# Correr en terminal para ejecutar el contenedor
docker run -p 8000:8000 graph-viewer
```

5. Abrir localhost en el navegador (http://localhost:8000/)

## Documentación
### Data
En esta carpeta solamente deben estar los modelos de datos en forma de grafo en formato parquet

Documentación de parquet: https://parquet.apache.org/docs/

### Frontend
En esta carpeta solamente deben estar todos los elementos visuales del frontend.

El archivo index.html contiene lo que se muestra primero al ejecutar el contenedor. De momento solamente despliega un título, subtítulo y el grafo contenido en data/graph_model.parquet

### Dockerfile
En este archivo se contienen las instrucciones para construir la imagen Docker

### generate_parquet.py
Este archivo genera el archivo de graph_model.parquet, solo hace falta definir los nodos y relaciones de nodos del grafo.

### main.py
Este archivo genera el endpoint para poder visualizar el grafo usando FastAPI

### requirements.yaml
En este archivo se deben incluir todos las dependencias necesarias enlistadas. Este archivo se lee al momento de construir la imagen Docker, instalando todo lo necesario para estar construido correctamente.

