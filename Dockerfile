FROM prom/node-exporter:v0.16.0

ENV CONSUL_VERSION 1.2.0

COPY ["entrypoint.sh", "/"]

USER root

RUN wget -O consul.zip "https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip" \
  && unzip consul.zip -d /bin/ \
  && rm consul.zip \
  && chmod 755 /entrypoint.sh

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8500 8600 8600/udp

ENTRYPOINT ["/bin/sh","-c","./entrypoint.sh"]
