#!/bin/bash

userName=master

echo "### Installing git:"
yum install -y git-core

echo "### Cloning puppetlab repo from HEAD:"
git clone git@github.com:s147043656/puppetlab.git puppetlab

echo "### Installing scripts for automated git update and puppet applying:"
cd puppetlab/bash-scripts
cp gitupdate.sh /usr/local/bin && chmod 755 /usr/local/bin/gitupdate.sh && chown root.root /usr/local/bin/gitupdate.sh
cp papply.sh /usr/local/bin && chmod 755 /usr/local/bin/papply.sh && chown root.root /usr/local/bin/papply.sh

echo "###Creating of  ${userName} user:"
useradd -m ${userName}

echo "### Installing SSH keys:"
cp -a /root/.ssh /home/${userName}
chown -R ${userName}.${userName} /home/${userName}/.ssh

echo "### Installing puppet-server:"
yum install -y epel-release
yum update
yum install -y puppet-server

echo "### Adding cron jobs for root and ${userName}:"

checkCron=`crontab -l -u ${userName} | grep -e "^\*.*gitupdate\.sh$"`
if [ "${checkCron}" == "" ];
  then
    { crontab -l -u ${userName}; echo '*/1 * * * * /usr/local/bin/gitupdate.sh'; } | crontab -u ${userName} -
  else
    echo "Gitupdate cron job for ${userName} already is added."
fi
checkCron=`crontab -l -u root | grep -e "^\*.*papply\.sh$"`
if [ "${checkCron}" == "" ];
  then
    { crontab -l -u root; echo '*/1 * * * * /usr/local/bin/papply.sh'; } | crontab -u root -
  else
    echo "Papply cron job for root already is added."
fi

echo "### Done."
