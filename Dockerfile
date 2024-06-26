ARG ZABBIX_SERVER_IMAGE
ARG ZABBIX_SERVER_TAG

FROM ${ZABBIX_SERVER_IMAGE}:${ZABBIX_SERVER_TAG}

USER root

RUN apt-get update && apt-get install unixodbc unixodbc-dev odbc-mariadb vim -y

COPY odbc.ini /etc/odbc.ini
