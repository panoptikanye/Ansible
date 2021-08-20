#!/bin/bash

## start etcd with flags

ETCD_INITIAL_CLUSTER="infra0=https://192.168.3.22:2380,infra1=https://192.168.3.23:2380,infra2=https://192.168.3.24:2380"
ETCD_INITIAL_CLUSTER_STATE=new

etcd --name infra0 --initial-advertise-peer-urls https://192.168.3.22:2380 \
--listen-peer-urls https://192.168.3.22:2380 \
--listen-client-urls https://192.168.3.22:2379,https://127.0.0.1:2379 \
--advertise-client-urls https://192.168.3.22:2379 \
--initial-cluster-token etcd-cluster-1 \
--peer-client-cert-auth --peer-trusted-ca-file=/etc/ssl/certs/ca.pem \
--peer-cert-file=/etc/ssl/certs/peer-{192.168.3.22}.pem --peer-key-file=/etc/ssl/certs/peer-{192.168.3.22}-key.pem \
--data-dir=/var/lib/etcd --force-new-cluster

