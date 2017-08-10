#!/bin/bash

# This script installs deployment system to use git and puppet

if [ $# -lt 1 ];
  then
    echo "Usage: $0 newHostName"
  exit 1
fi

if [ -f /etc/redhat-release ]; then
  if [ `head -1 /etc/redhat-release | awk '{print $1}'` == "RedHat" ]; then
    distrType=RedHat
  elif
    [ `head -1 /etc/redhat-release | awk '{print $1}'` == "CentOS" ]; then
      distrType=CentOS
  fi
elif
  [ `head -1 /etc/issue | awk '{print $1}'` == "Ubuntu" ]; then
  distrType=Ubuntu
fi

case $distrType in
  RedHat|CentOS|Debian|Ubuntu)
    echo "Starting bootstrap for $distrType"
    ;;
  *)
    echo "Distributive is not defined or not supported." && exit 1
    ;;
esac

echo "Starting bootstrap for $distrType"


echo "### Renaming host to new name $1:"
hostnamectl set-hostname $1
echo "### Done."

echo "### Installing deployment scripts and variables:"
cp deployment-variables /usr/local/etc/
. /usr/local/etc/deployment-variables
cp gitupdate.sh /usr/local/bin && chmod 755 /usr/local/bin/gitupdate.sh && chown root.root /usr/local/bin/gitupdate.sh
cp papply5.sh /usr/local/bin && chmod 755 /usr/local/bin/papply5.sh && chown root.root /usr/local/bin/papply5.sh
echo "### Done."

echo "### Creating ${userName} user:"
useradd -m ${userName}
cp -a /root/.ssh /home/${userName}
chown -R ${userName}.${userName} /home/${userName}/.ssh
echo "### Done."

echo "### Installing pupper-server:"
  case $distrType in
    RedHat|CentOS)
      rpm -Uvh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
      yum install -y puppet-agent
      yum install -y puppetserver
      ;;
    Debian|Ubuntu)
      wget https://apt.puppetlabs.com/puppet5-release-xenial.deb
      dpkg -i puppet5-release-xenial.deb
      apt update
      apt-get -y install puppet-agent
      apt-get -y install puppetserver
      ;;
  esac
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
checkCron=`crontab -l -u root | grep -e "^\*.*papply5\.sh$"`
if [ "${checkCron}" == "" ];
  then
    { crontab -l -u root; echo '*/3 * * * * /usr/local/bin/papply5.sh'; } | crontab -u root -
  else
    echo "Papply cron job for root was already added."
fi
echo "### Done."
