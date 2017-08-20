#!/bin/bash

useradd -s /bin/bash -d /opt/stack -m stack
echo "stack ALL=(ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/stack
su - stack -c "git clone https://git.openstack.org/openstack-dev/devstack"
su - stack -c "cd devstack && cp /usr/local/etc/devstack/local.conf ."
su - stack -c "cd devstack && ./stack.sh"
