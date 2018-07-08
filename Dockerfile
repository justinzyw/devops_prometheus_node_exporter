FROM prom/node-exporter:v0.16.0

USER root

ADD apk /bin

RUN chmod 777 /bin/apk

