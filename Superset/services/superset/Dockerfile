FROM apache/superset:99797911bdbfff630ef90c6ec1ecf93f4e3fe222

# Switching to root to install the required packages
USER root

COPY Cisco_Umbrella_Root_CA.cer ./
RUN pip install sqlalchemy-trino kylinpy || \
    pip install --cert Cisco_Umbrella_Root_CA.cer  --trusted-host pypi.org sqlalchemy-trino kylinpy
# Switching back to using the `superset` user
USER superset

## ToDo: La mejor practica es hacer estos proceso al lanzar el conenedor utilizando "enviroment variables". Esto es 
#       solo una prueba de concepto
RUN superset fab create-admin \
               --username admin \
               --firstname Superset \
               --lastname Admin \
               --email admin@superset.com \
               --password admin && \
    superset db upgrade && \
    superset init

#Importa la conexion a trino
COPY datasources.yml /tmp/
RUN superset import-datasources --path /tmp/datasources.yml
