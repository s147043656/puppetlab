#!/bin/bash

# This script installs deployment system to use git and puppet

if [ $# -lt 1 ];
  then
    echo "Usage: $0 newHostName"
  exit 1
fi

echo "### Renaming host to new name $1:"
hostnamectl set-hostname $1
echo "### Done."

echo "### Installing deployment scripts and variables:"
cp deployment-variables /usr/local/etc/
. /usr/local/etc/deployment-variables
cp gitupdate.sh /usr/local/bin && chmod 755 /usr/local/bin/gitupdate.sh && chown root.root /usr/local/bin/gitupdate.sh
cp papply.sh /usr/local/bin && chmod 755 /usr/local/bin/papply.sh && chown root.root /usr/local/bin/papply.sh
echo "### Done."

echo "### Creating ${userName} user:"
useradd -m ${userName}
cp -a /root/.ssh /home/${userName}
chown -R ${userName}.${userName} /home/${userName}/.ssh
echo "### Done."

echo "### Installing pupper-server:"
yum install -y puppet-server
echo "### Done."

echo "### Cron for ${userName}:"
checkCron=`crontab -l -u ${userName} | grep -e "^\*.*gitupdate\.sh$"`
if [ "${checkCron}" == "" ];
  then
    { crontab -l -u ${userName}; echo '*/1 * * * * /usr/local/bin/gitupdate.sh'; } | crontab -u ${userName} -
  else
    echo "Gitupdate cron job for ${userName} was already added."
fi
echo "### Done."

echo "### Cron for root:"
checkCron=`crontab -l -u root | grep -e "^\*.*papply\.sh$"`
if [ "${checkCron}" == "" ];
  then
    { crontab -l -u root; echo '#*/3 * * * * /usr/local/bin/papply.sh'; } | crontab -u root -
  else
    echo "Papply cron job for root was already added."
fi
echo "### Done."
