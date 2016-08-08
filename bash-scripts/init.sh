#!/bin/bash

# Install Git
yum install -y git-core

# Clone puppetlab HEAD
git clone git@github.com:s147043656/puppetlab.git

# Install scripts for git updates and puppet applying
cd puppetlab/bash-scripts
cp gitupdate.sh /usr/local/bin && chmod 755 /usr/local/bin/gitupdate.sh && chown root.root /usr/local/bin/gitupdate.sh
cp papply.sh /usr/local/bin && chmod 755 /usr/local/bin/papply.sh && chown root.root /usr/local/bin/papply.sh

# Create master users
useradd -m master

# Add cron jobs for master user
{ crontab -l -u master; echo '*/1 * * * * /usr/local/bin/gitupdate.sh'; } | crontab -u master -

# Install puppet-server
yum install -y epel-release
yum update
yum install -y puppet-server

#Add cron jobs for root user
{ crontab -l -u root; echo '*/1 * * * * /usr/local/bin/papply.sh'; } | crontab -u root -
