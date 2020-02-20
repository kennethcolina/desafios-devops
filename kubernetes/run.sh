#!/bin/bash

set -e

APP_NAME="idwall-app"
CLUSTER_IP=$(minikube ip)
APP_URL="${APP_NAME}.example.com"

kubectl create -f ${APP_NAME}/namespace.yml
kubectl create -f ${APP_NAME}/ingress.yml
kubectl create -f ${APP_NAME}/ingress-nginx.yml
kubectl create -f ${APP_NAME}/deployment.yml
kubectl create -f ${APP_NAME}/service.yml

echo "${CLUSTER_IP} ${APP_URL}" | sudo tee -a /etc/hosts
curl ${CLUSTER_IP} -H 'Host: ${APP_URL}'