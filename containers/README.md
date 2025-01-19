### Tecnología para generar contenedores
La **tecnología de contenedores** es una herramienta clave en el desarrollo y despliegue de software moderno, diseñada para facilitar la creación, empaquetado y distribución de aplicaciones y sus dependencias en entornos aislados y consistentes. Su adopción ha transformado la manera en que las organizaciones gestionan infraestructuras y despliegan aplicaciones a gran escala.

#### **Definición y características principales**
Un contenedor es una unidad de software que empaqueta código y todas sus dependencias necesarias para que una aplicación pueda ejecutarse de manera uniforme en diferentes entornos. Se diferencia de las máquinas virtuales porque comparte el mismo sistema operativo base, lo que hace que sea más ligero y eficiente en recursos.

**Características principales:**
- **Ligereza:** Los contenedores suelen ocupar pocos megabytes, comparados con las máquinas virtuales, y arrancan casi instantáneamente.
- **Portabilidad:** Pueden ejecutarse de manera consistente en cualquier lugar que soporte contenedores (por ejemplo, una laptop, un servidor, o la nube).
- **Aislamiento:** Cada contenedor opera de forma independiente, lo que asegura que los cambios en uno no afecten a otros.
- **Escalabilidad:** Facilitan la replicación de servicios para manejar cargas de trabajo variables.

#### **Componentes esenciales**
- **Motor de contenedores:** Software que crea, ejecuta y gestiona contenedores (por ejemplo, Docker o Podman).
- **Imagen de contenedor:** Un archivo que contiene todo el necesario para ejecutar la aplicación, incluyendo código, bibliotecas, herramientas y configuraciones.
- **Registro de imágenes:** Repositorio donde se almacenan y distribuyen imágenes de contenedores, como Docker Hub o Amazon Elastic Container Registry (ECR).
- **Orquestadores:** Herramientas para gestionar contenedores a gran escala en clústeres, como Kubernetes o Docker Swarm.

#### **Ventajas de los contenedores**
- **Consistencia en entornos de desarrollo y producción:** Elimina problemas de compatibilidad.
- **Optimización de recursos:** Utilizan menos CPU y memoria que las máquinas virtuales.
- **Facilidad de implementación continua (CI/CD):** Simplifican la integración y entrega continua de software.
- **Compatibilidad con microservicios:** Soportan la arquitectura de microservicios, donde las aplicaciones se dividen en componentes pequeños e independientes.

#### **Herramientas populares**
- **Docker:** Plataforma pionera que popularizó el uso de contenedores.
- **Kubernetes:** Sistema de orquestación de contenedores, ampliamente utilizado para gestionar aplicaciones distribuidas.
- **Podman:** Alternativa a Docker, que no requiere un demonio central.
- **OpenShift:** Plataforma empresarial basada en Kubernetes.

_________________________________

### **Instalación en sistema operativo Ms. Windows 11:**

**Requisitos previos:**

  * **Windows 11:** Asegúrate de tener instalado Windows 11 con la versión 19043 o superior.
  * **WSL 2 (Windows Subsystem for Linux 2):** Debe estar habilitado. Puedes seguir esta guía oficial para habilitarlo: [https://docs.microsoft.com/en-us/windows/wsl/install-win10](https://www.google.com/url?sa=E&source=gmail&q=https://docs.microsoft.com/en-us/windows/wsl/install-win10)
  * **6 GB de RAM:** Se recomienda tener al menos 6 GB de RAM para el funcionamiento óptimo de la máquina Podman.

**Pasos:**

1.  **Descarga el instalador:** Visita la página oficial de Podman Desktop y descarga el instalador para Windows: [https://podman-desktop.io/docs/installation/windows-install](https://podman-desktop.io/docs/installation/windows-install)
2.  **Ejecuta el instalador:** Una vez descargado, ejecuta el archivo .exe y sigue las instrucciones del asistente de instalación.
3.  **Configuración inicial:**
      * **Máquina:** Podman Desktop utilizará WSL 2 como proveedor de máquinas.
      * **Otros ajustes:** Puedes personalizar otras opciones según tus necesidades, como la ubicación de los archivos de configuración.
4.  **Verifica la instalación:** Una vez completada la instalación, inicia Podman Desktop. Deberías ver la interfaz principal donde podrás crear y gestionar contenedores.

### **Instalación en sistema operativo Ubuntu Linux:**

**Requisitos previos:**

  * **Ubuntu:** Asegúrate de tener instalada una versión compatible de Ubuntu.
  * **Permisos de root:** Necesitarás permisos de root para instalar Podman.

**Pasos:**

1.  **Actualiza los repositorios:**
    ```bash
    sudo apt update
    ```
2.  **Instala Podman:**
    ```bash
    sudo apt install podman
    ```
3.  **Instala Podman Desktop (opcional):**
    Si deseas utilizar la interfaz gráfica de Podman Desktop, puedes instalarla desde el repositorio oficial o a través de un paquete .deb. Consulta la documentación oficial de Podman Desktop para obtener instrucciones específicas.

**Consideraciones adicionales:**
  * **Rootless mode:** Podman puede ejecutarse en modo rootless, lo que proporciona mayor seguridad. Consulta la documentación oficial para obtener más información sobre cómo habilitarlo.
  * **Configuración:** Podman ofrece muchas opciones de configuración. Puedes personalizar el comportamiento de Podman editando los archivos de configuración.
  * **Uso:** Una vez instalado, puedes utilizar Podman para crear, iniciar, detener y eliminar contenedores, así como gestionar imágenes de contenedores.

**Recursos adicionales:**
  * **Documentación oficial de Podman Desktop:** [https://podman-desktop.io/docs/](https://podman-desktop.io/docs/)
_____________________________
> By CISO oswaldo.diaz@inegi.org.mx
