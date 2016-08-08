#!/bin/sh

checkoutDir=/home/master/puppetlab-${HOSTNAME}
puppet apply ${checkoutDir}/puppet/manifests/site.pp --modulepath=${checkout}/puppet/modules/ $*
