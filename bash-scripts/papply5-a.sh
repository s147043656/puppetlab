#!/bin/bash

userName=root
gitUrl="git@github.com:s147043656/puppetlab.git"
branchName=master
puppetExec=/opt/puppetlabs/bin/puppet
puppetLogs=/var/log/puppetlabs/puppet/papply5.log

userHome=`eval echo ~${userName}`
gitDir=${userHome}/git

if [ -d ${gitDir} ];
  then
    rm -rf $gitDir
fi

git clone -b ${branchName} ${gitUrl} ${gitDir}

${puppetExec} apply ${gitDir}/puppet5/manifests/site.pp \
  --modulepath=${gitDir}/puppet5/modules/ \
  --logdest ${puppetLog} \
  $*
