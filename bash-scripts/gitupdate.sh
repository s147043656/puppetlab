#!/bin/bash

if [ ! -d ~/puppetlab-${HOSTNAME} ];
  then
    git clone -b ${HOSTNAME} git@github.com:s147043656/puppetlab.git puppetlab-${HOSTNAME}
  else
    cd ~/puppetlab-${HOSTNAME} && git pull
fi
