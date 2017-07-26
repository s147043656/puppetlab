#!/bin/bash

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

create -f /etc/kubernetes/container-configs/springlab1-service.yaml
create -f /etc/kubernetes/container-configs/springlab1-rc.yaml
create -f /etc/kubernetes/container-configs/springlab2-service.yaml
create -f /etc/kubernetes/container-configs/springlab2-rc.yaml
