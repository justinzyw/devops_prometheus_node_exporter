#!/bin/sh

mkdir /tmp/consul

nohup /bin/consul agent -data-dir=/tmp/consul \
-retry-join=devops-prometheus-consul \
-bind=$(ip -o -4 addr list eth0 | head -n1 | awk '{print $4}' | cut -d/ -f1) \
-client=$(ip -o -4 addr list eth0 | head -n1 | awk '{print $4}' | cut -d/ -f1) &

exec sh -c ./bin/node_exporter
