#!/bin/bash

# This script installs deployment system to use git and puppet

papplyName=papply

if [ $# -lt 1 ]; then
    echo "Usage: $0 newHostName" && exit 1
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
  else
    echo "Distributive is not defined or not supported." && exit 1
fi

echo -e "\n### Installing pupper-server for ${distrType}:"
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

echo "### Renaming host to new name $1:"
hostnamectl set-hostname $1
echo "### Done."

echo "### Installing deployment script:"
cp ${papplyName}.sh /usr/local/bin && chmod 755 /usr/local/bin/${papplyName}.sh && chown root.root /usr/local/bin/${papplyName}.sh
echo "### Done."

echo -e "### Setup cron for root:"
checkCron=`crontab -l -u root | grep -e "^\*.*${papplyName}\.sh$"`
if [ "${checkCron}" == "" ];  then
    { crontab -l -u root; echo "*/5 * * * * /bin/bash /usr/local/bin/${papplyName}.sh"; } | crontab -u root -
  else
    echo "Papply cron job for root was already added."
fi
echo "### Done."
