#!/bin/bash

# Script for each node in a 3-node etcd cluster

# Set environment variables

ETCD_INITIAL_CLUSTER="etcd-node-1=http://192.168.3.22:2380,etcd-node-2=http://192.168.3.23:2380,etcd-node-3=http://192.168.3.24:2380"
ETCD_INITIAL_CLUSTER_STATE=new

REGISTRY=gcr.io/etcd-development/etcd

# For each machine
ETCD_VERSION=latest
TOKEN=my-etcd-token
CLUSTER_STATE=new
NAME_1=etcd-node-1
NAME_2=etcd-node-2
NAME_3=etcd-node-3
HOST_1=192.168.3.22
HOST_2=192.168.3.23
HOST_3=192.168.3.24
CLUSTER=${NAME_1}=http://${HOST_1}:2380,${NAME_2}=http://${HOST_2}:2380,${NAME_3}=http://${HOST_3}:2380
DATA_DIR=/var/lib/etcd

# For node 1
THIS_NAME=${NAME_1}
THIS_IP=${HOST_1}
docker run \
  -p 2379:2379 \
  -p 2380:2380 \
  --volume=${DATA_DIR}:/var/etcd/data \
  --name etcd ${REGISTRY}:${ETCD_VERSION} \
  /usr/local/bin/etcd \
  --data-dir=/etcd-data --name ${THIS_NAME} \
  --initial-advertise-peer-urls http://${THIS_IP}:2380 --listen-peer-urls http://0.0.0.0:2380 \
  --advertise-client-urls http://${THIS_IP}:2379 --listen-client-urls http://0.0.0.0:2379 \
  --initial-cluster ${CLUSTER} \
  --initial-cluster-state ${CLUSTER_STATE} --initial-cluster-token ${TOKEN} \
  --peer-client-cert-auth --peer-trusted-ca-file=/etc/ssl/certs/ca.pem \
  --peer-cert-file=/etc/ssl/certs/peer-{192.168.3.22}.pem --peer-key-file=/etc/ssl/certs/peer-{192.168.3.22}-key.pem
