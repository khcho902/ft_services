#!/bin/zsh

minikube start --driver=virtualbox

minikube addons enable metallb
minikube addons enable dashboard
minikube addons enable metrics-server

eval $(minikube docker-env)

# Build docker images
docker build -t nginx-image ./srcs/nginx
docker build -t ftps-image ./srcs/ftps
docker build -t mysql-image ./srcs/mysql
docker build -t phpmyadmin-image ./srcs/phpmyadmin
docker build -t wordpress-image ./srcs/wordpress

# Apply yaml files
kubectl apply -f ./srcs/metallb/metallb.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/ftps/ftps.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml
