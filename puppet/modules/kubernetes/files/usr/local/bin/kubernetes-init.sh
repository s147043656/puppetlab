#!/bin/bash

REGISTRY_URL=$1
APP_VERSION=$2

for IMAGE in kubernetes-apiserver kubernetes-controller-mgr kubernetes-scheduler pod-infrastructure; do
  docker pull registry.access.redhat.com/rhel7/$IMAGE
  docker tag registry.access.redhat.com/rhel7/$IMAGE $REGISTRY_URL/rhel7/$IMAGE:$APP_VERSION
  docker push $REGISTRY_URL/rhel7/$IMAGE:$APP_VERSION
done

for SERVICE in docker etcd kube-proxy kubelet; do
    systemctl restart $SERVICE
    systemctl enable $SERVICE
    systemctl is-active $SERVICE
done

for SERVICE in docker kube-proxy.service kubelet.service; do
    systemctl restart $SERVICE
    systemctl enable $SERVICE
    systemctl status $SERVICE
done

ss -tulnp | grep -E "(kube)|(etcd)"

curl -s -L http://localhost:2379/version

sleep 60
kubectl create -f /etc/kubernetes/container-configs/springlab1-service.yaml
sleep 10
kubectl create -f /etc/kubernetes/container-configs/springlab1-rc.yaml
sleep 10
kubectl create -f /etc/kubernetes/container-configs/springlab2-service.yaml
sleep 10
kubectl create -f /etc/kubernetes/container-configs/springlab2-rc.yaml

kubectl cluster-info
kubectl get rc
kubectl get pods --all-namespaces=true
kubectl get service --all-namespaces=true
kubectl logs kube-controller-manager-127.0.0.1

# kubectl delete rc springlab1-controller
# kubectl delete rc springlab2-controller
# kubectl delete service springlab1-service
# kubectl delete service springlab2-service
