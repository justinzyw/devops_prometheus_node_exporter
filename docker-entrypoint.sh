#!/bin/bash

exec bash -c /bin/consul agent -data-dir=/tmp/consul -join=devops-prometheus-consul

exec bash -c /bin/node_exporter
