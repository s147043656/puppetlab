#!/bin/bash

userName=root
userHome=`eval echo ~${userName}`

gitUrl="git@github.com:s147043656/puppetlab.git"
branchName=master
gitDir=${userHome}/git-${branchName}

puppetExec=/opt/puppetlabs/bin/puppet
puppetManifest=${gitDir}/puppet5/manifests
puppetModules=${gitDir}/puppet5/modules
puppetLog=/var/log/puppetlabs/puppet/papply.log
#puppetLog=console

if [ ! -d ${gitDir} ]; then
    git clone -b ${branchName} ${gitUrl} ${gitDir}
  else
    cd ${gitDir} && git pull
fi

${puppetExec} apply ${puppetManifest} --modulepath=${puppetModules} --logdest ${puppetLog} $*
