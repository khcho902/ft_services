#!/bin/zsh

minikube start --driver=virtualbox \
			--bootstrapper=kubeadm	\
			--extra-config=kubelet.authentication-token-webhook=true \
			--extra-config=apiserver.service-node-port-range=3000-35000
minikube addons enable metallb
minikube addons enable dashboard
minikube addons enable metrics-server

eval $(minikube docker-env)

kubectl apply -f ./srcs/metallb/metallb.yaml

#######################################
docker build -t nginx-image ./srcs/nginx
docker build -t ftps-image ./srcs/ftps


#######################################
kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/ftps/ftps.yaml


