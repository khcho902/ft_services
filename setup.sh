#!/bin/zsh

minikube start --driver=virtualbox

minikube addons enable metallb
minikube addons enable dashboard
minikube addons enable metrics-server

eval $(minikube docker-env)

kubectl apply -f ./srcs/metallb/metallb.yaml


# mysql 
docker build -t mysql-image ./srcs/mysql
kubectl apply -f ./srcs/mysql/mysql.yaml

# phpmyadmin
docker build -t phpmyadmin-image ./srcs/phpmyadmin
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml

# wordpress
docker build -t wordpress-image ./srcs/wordpress
kubectl apply -f ./srcs/wordpress/wordpress.yaml

# ftps
docker build -t ftps-image ./srcs/ftps
export FTPS_IP=$(kubectl get svc | grep phpmyadmin | awk '{print $4}')
sed "s/FTPS_IP/$FTPS_IP/g" ./srcs/ftps/ftps.yaml.og > ./srcs/ftps/ftps.yaml
kubectl apply -f ./srcs/ftps/ftps.yaml

# influxdb
docker build -t influxdb-image ./srcs/influxdb
kubectl apply -f ./srcs/influxdb/influxdb.yaml

# grafana
docker build -t grafana-image ./srcs/grafana
kubectl apply -f ./srcs/grafana/grafana.yaml

# nginx
docker build -t nginx-image ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml
