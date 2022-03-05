#!/bin/sh

master_ip=$1

sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --apiserver-advertise-address=$master_ip

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# install calico
curl https://projectcalico.docs.tigera.io/manifests/calico.yaml -O
kubectl apply -f calico.yaml
