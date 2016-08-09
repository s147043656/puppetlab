#!/bin/bash

. /usr/local/etc/deployment-variables

if [ ! -d ~/${gitDir} ];
  then
    git clone -b ${branchName} ${gitUrl} ${gitDir}
  else
    cd ~/${gitDir} && git pull
fi
