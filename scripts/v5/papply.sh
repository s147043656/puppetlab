#!/bin/bash

userName=root
userHome=`eval echo ~${userName}`

gitUrl="git@github.com:s147043656/puppetlab.git"
branchName=master
gitDir=${userHome}/git-${branchName}

puppetExec=/opt/puppetlabs/bin/puppet
puppetManifest=${gitDir}/puppet5/manifests/site.pp
puppetModules=${gitDir}/puppet5/modules/
puppetLog=/var/log/puppetlabs/puppet/papply.log

if [ -d ${gitDir} ]; then
    rm -rf $gitDir
fi

git clone -b ${branchName} ${gitUrl} ${gitDir}
${puppetExec} apply ${puppetManifest} --modulepath=${puppetModules} --logdest ${puppetLog} $*
