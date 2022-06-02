#!/bin/bash
#/opt/consul/consul agent -dev -data-dir /opt/consul/data -ui -client 0.0.0.0 &> /opt/consul/consul.log &
/opt/consul/consul agent -server -ui -data-dir /opt/consul/data -client 0.0.0.0 -bootstrap-expect 3 &> /opt/consul/consul.log &
/opt/consul/consul agent -server -ui -data-dir /opt/consul/data -client 0.0.0.0 -retry-join 10.238.239.31 &> /opt/consul/consul.log &
echo "start success!"
