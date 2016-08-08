#!/bin/bash

echo "### Installing git:"
yum install -y git-core

echo "### Cloning puppetlab repo from HEAD:"
git clone git@github.com:s147043656/puppetlab.git puppetlab

echo "### Installing scripts for automated git update and puppet applying:"
cd puppetlab/bash-scripts
cp gitupdate.sh /usr/local/bin && chmod 755 /usr/local/bin/gitupdate.sh && chown root.root /usr/local/bin/gitupdate.sh
cp papply.sh /usr/local/bin && chmod 755 /usr/local/bin/papply.sh && chown root.root /usr/local/bin/papply.sh

echo "###Creating of  master user:"
useradd -m master

echo "### Installing puppet-server:"
yum install -y epel-release
yum update
yum install -y puppet-server

echo "### Adding cron jobs for root and master:"

checkCron=`crontab -l -u master | grep -e "^\*.*gitupdate\.sh$"`
if [ "${checkCron}" == "" ];
  then
    { crontab -l -u master; echo '*/1 * * * * /usr/local/bin/gitupdate.sh'; } | crontab -u master -
  else
    echo "Gitupdate cron job for master already is added."
fi
checkCron=`crontab -l -u root | grep -e "^\*.*papply\.sh$"`
if [ "${checkCron}" == "" ];
  then
    { crontab -l -u root; echo '*/1 * * * * /usr/local/bin/papply.sh'; } | crontab -u root -
  else
    echo "Papply cron job for root already is added."
fi

echo "### Done."
