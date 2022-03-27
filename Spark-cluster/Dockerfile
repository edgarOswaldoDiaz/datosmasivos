# Based on https://github.com/bitnami/bitnami-docker-spark/issues/34#issuecomment-984080782
# Workaround since offical image uses python
FROM bitnami/spark:3.2.0
ARG PYTHON_VERSION="3.9.9-0"
ARG PYTHON_SHA256SUM="592655ff2f275a22358bc44b02d5d3a2c18af7427990ca92319c5a9154b700f7"
USER root
# https://bitnami .com/stack/python/containers
RUN set -eux \
    && . /opt/bitnami/scripts/libcomponent.sh \
    && component_unpack "python" "$PYTHON_VERSION" --checksum "$PYTHON_SHA256SUM"
USER 1001
