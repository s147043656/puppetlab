#!/bin/bash

hostsFile=/tmp/hosts

echo "127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4" > $hostsFile
echo "::1         localhost localhost.localdomain localhost6 localhost6.localdomain6" >> $hostsFile

echo -e "\n#### CentOS 7 hosts\n" >> $hostsFile

i=1
while [ $i -lt 100 ]; do
  echo "192.168.7.$i c7i$i.vtdomain c7i$i" >> $hostsFile
  i=$[$i+1]
done

echo -e "\n#### Ubuntu 16.04  hosts\n" >> $hostsFile

i=101

while [ $i -lt 200 ]; do
  echo "192.168.7.$i u16i$i.vtdomain u16i$i" >> $hostsFile
  i=$[$i+1]
done

