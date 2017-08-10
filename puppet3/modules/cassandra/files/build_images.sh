#!/bin/bash

cassDist=apache-cassandra-3.7-bin.tar.gz
cassDir=apache-cassandra-bin

if [ ! -f ${cassDist} ]; then
    wget "http://apache.cp.if.ua/cassandra/3.7/apache-cassandra-3.7-bin.tar.gz"
fi

if [ -d ${cassDir} ]; then
    rm -rf ${cassDir}
fi

tar -xzf ${cassDist}
tmpCassDir=`echo ${cassDist} | sed -e 's/\-bin\.tar\.gz//'`
mv ${tmpCassDir} ${cassDir}

tar -czf ${cassDir}.tar.gz ${cassDir}

echo "Building CASSANDRA image named: cassandra"
docker rmi cassandra
docker build . -t cassandra
