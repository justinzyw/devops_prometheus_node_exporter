#!/bin/bash

mkdir /tmp/consul

exec sh -c ./bin/consul agent -data-dir=/tmp/consul -join=devops-prometheus-consul

exec sh -c ./bin/node_exporter
