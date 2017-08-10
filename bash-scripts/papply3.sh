#!/bin/sh

. /usr/local/etc/deployment-variables

puppet apply ${gitDir}/puppet3/manifests/site.pp --modulepath=${gitDir}/puppet3/modules/ $*

