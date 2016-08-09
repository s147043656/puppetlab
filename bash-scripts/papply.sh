#!/bin/sh

. /usr/local/etc/deployment-variables

puppet apply ${gitDir}/puppet/manifests/site.pp --modulepath=${gitDir}/puppet/modules/ $*
