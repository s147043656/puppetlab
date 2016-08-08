#!/bin/sh

homeDir=/home/master
puppet apply $homeDir/puppetlab-$HOSTNAME/puppet/manifests/site.pp --modulepath=$homeDir/puppet/modules/ $*