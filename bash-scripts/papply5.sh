#!/bin/sh

. /usr/local/etc/deployment-variables

puppet apply ${gitDir}/puppet5/manifests/site.pp --modulepath=${gitDir}/puppet5/modules/ --logdest /var/log/papply5.log $*
