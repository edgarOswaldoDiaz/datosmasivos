FROM openjdk:8-alpine

MAINTAINER Fredrik Hoem Grelland <https://github.com/fredrikhgrelland>
MAINTAINER Nikita Zhevnitskiy <https://github.com/zhenik>

# HADOOP

# Allow buildtime config of HADOOP_VERSION
ARG HADOOP_VERSION
# Set HADOOP_VERSION from arg if provided at build, env if provided at run, or default
ENV HADOOP_VERSION=${HADOOP_VERSION:-3.1.2}
ENV DOWNLOAD https://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV USER=root
ENV PATH $HADOOP_HOME/bin/:$PATH

# if u use proxy
# COPY ca_certificates/* /usr/local/share/ca-certificates/

RUN \
  apk add --no-cache ca-certificates procps curl tar bash perl \
  && update-ca-certificates 2>/dev/null || true && echo "NOTE: CA warnings suppressed." \
  && rm -rf /var/cache/apk/* \
  #Test download ( does ssl trust work )
  && curl -s -I -o /dev/null $DOWNLOAD || echo -e "\n###############\nERROR: You are probably behind a corporate proxy. Add your custom ca .crt in the ca_certificates docker build folder\n###############\n" \
  #Download and unpack hadoop
  && curl -s -L $DOWNLOAD | tar xz -C /opt/ \
  && ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop \
  && mkdir /opt/hadoop-$HADOOP_VERSION/logs

# HIVE
# Allow buildtime config of HIVE_VERSION
ARG HIVE_VERSION
# Set HIVE_VERSION from arg if provided at build, env if provided at run, or default
ENV HIVE_VERSION=${HIVE_VERSION:-3.1.2}
ENV HIVE_DOWNLOAD https://archive.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz
ENV HIVE_HOME /opt/hive
ENV POSTGRES_JDBC_VERSION 42.2.12
ENV PATH $HIVE_HOME/bin:$PATH

WORKDIR /opt

#Install Hive and PostgreSQL JDBC
RUN curl -L https://archive.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz | \
        tar xz && mv apache-hive-$HIVE_VERSION-bin hive && \
        mkdir $HIVE_HOME/extlib

RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.26.tar.gz \
    && tar -xvf mysql-connector-java-8.0.26.tar.gz \
    && cp mysql-connector-java-8.0.26/mysql-connector-java-8.0.26.jar $HIVE_HOME/lib 

#Install AWS s3 drivers
RUN ln -s $HADOOP_HOME/share/hadoop/tools/lib/aws-java-sdk-bundle-*.jar $HIVE_HOME/lib/. && \
    ln -s $HADOOP_HOME/share/hadoop/tools/lib/hadoop-aws-$HADOOP_VERSION.jar $HIVE_HOME/lib/. && \
    ln -s $HADOOP_HOME/share/hadoop/tools/lib/aws-java-sdk-bundle-*.jar $HADOOP_HOME/share/hadoop/common/lib/. && \
    ln -s $HADOOP_HOME/share/hadoop/tools/lib/hadoop-aws-$HADOOP_VERSION.jar $HADOOP_HOME/share/hadoop/common/lib/. \
    && rm /opt/hive/lib/log4j-slf4j-impl-*.jar

# copy all to temporary folder
COPY . /var/tmp/
# move hive config
RUN mv /var/tmp/conf/* $HIVE_HOME/conf/
# extend rights
RUN chmod +x /var/tmp/bin/*
# move executable to bin
RUN mv /var/tmp/bin/* /usr/local/bin/
# remove temporary folder
RUN rm -rf /var/tmp/*

# hive server
EXPOSE 10000
# ui
EXPOSE 10002
# thrift
EXPOSE 9083

ENTRYPOINT ["entrypoint.sh"]
# options:
#   - hiveserver (start container in hive server mode) DEFAULT
#   - hivemetastore (start container in hive metastore mode)
CMD hiveserver
