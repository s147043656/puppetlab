#!/bin/bash

workDir=/tmp

sudo useradd -s /bin/bash -d /opt/stack -m stack
echo "stack ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/stack
su - stack -c "/bin/bash $workDir/openstack-dev-setup.sh"