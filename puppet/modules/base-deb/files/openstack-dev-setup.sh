#!/bin/bash

git clone https://git.openstack.org/openstack-dev/devstack
cd devstack
cat << EOF > local.conf
[[local|localrc]]
HOST_IP=192.168.7.101
ADMIN_PASSWORD=a
DATABASE_PASSWORD=$ADMIN_PASSWORD
RABBIT_PASSWORD=$ADMIN_PASSWORD
SERVICE_PASSWORD=$ADMIN_PASSWORD
EOF
./stack.sh

