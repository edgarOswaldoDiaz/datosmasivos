### Contiene los notebooks de Jupyter para exploración de datos, preprocesamiento, entrenamiento y evaluación de modelos.

### Instalación de Podman Desktop

Podman Desktop es una herramienta para gestionar contenedores y máquinas virtuales de manera sencilla. Aquí te dejo los pasos para instalarlo:

#### **Descargar e Instalar Podman Desktop**
- **Windows**:
  - Descargar el instalador desde [Podman Desktop](https://podman-desktop.io/)
  - Ejecutar el instalador y sigue las instrucciones.
  - Verificar de que el servicio `podman machine` está en ejecución:
     ```sh
     podman machine init
     podman machine start
     ```

- **Linux** (Ejemplo con Fedora/Debian/Ubuntu):
  ```sh
  sudo apt update && sudo apt install -y podman
  ```
  Luego, instala Podman Desktop siguiendo la guía oficial o usando Flatpak:
  ```sh
  flatpak install flathub io.podman.Desktop
  ```

- **MacOS**:
  ```sh
  brew install podman
  ```
  Luego, configura Podman Machine:
  ```sh
  podman machine init
  podman machine start
  ```

#### **Verificar Instalación**
Ejecuta:
```sh
podman --version
podman ps
```

---

### Archivo `.yml` para el contenedor `jupyter/all-spark-notebook`
Podman usa archivos `compose.yml` similares a Docker. Aquí tienes un archivo `podman-compose.yml` para ejecutar el contenedor `jupyter/all-spark-notebook`:

```yaml
version: '3.8'
services:
  jupyter-spark:
    image: jupyter/all-spark-notebook:latest
    container_name: jupyter_spark
    ports:
      - "8181:8888"
    volumes:
      - ./work:/home/jovyan/work
    environment:
      - JUPYTER_ENABLE_LAB=yes
      - GRANT_SUDO=yes
      - NB_UID=1000
      - NB_GID=100
    command: "start-notebook.sh --NotebookApp.token='' --NotebookApp.password=''"
```

#### **Pasos para levantar el contenedor**
- Guardar el archivo como `podman-compose.yml` en una carpeta.
- Abrir una terminal en esa carpeta y ejecuta:
   ```sh
   podman-compose up -d
   ```
- Abrir un navegador y accede a `http://localhost:8181`.
__________________
> By CISO oswaldo.diaz@inegi.org.mx
