FROM prom/node-exporter:v0.16.0

ENV CONSUL_VERSION 1.2.0

USER root

RUN wget -O consul.zip "https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip" \
  && unzip consul.zip -d /bin/ \
  && rm consul.zip

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8500 8600 8600/udp

COPY docker-entrypoint.sh /bin/docker-entrypoint.sh

RUN chmod 777 /bin/docker-entrypoint.sh

ENTRYPOINT ["/bin/docker-entrypoint.sh"]
