#!/bin/bash

# Create user stack
sudo useradd -s /bin/bash -d /opt/stack -m stack

# Grant sudo su - permissions
echo "stack ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/stack

# Became stack
sudo su - stack

# Clone git repo for openstack-dev
git clone https://git.openstack.org/openstack-dev/devstack

# Go to devstack directory
cd devstack

# Create config file
cat << EOF > local.conf
[[local|localrc]]
HOST_IP=192.168.7.101
ADMIN_PASSWORD=a
DATABASE_PASSWORD=$ADMIN_PASSWORD
RABBIT_PASSWORD=$ADMIN_PASSWORD
SERVICE_PASSWORD=$ADMIN_PASSWORD
EOF

# Run OpenStak-Dev setup
./stack.sh
