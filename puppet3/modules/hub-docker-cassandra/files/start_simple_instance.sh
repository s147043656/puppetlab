#!/bin/bash

if [ $# -lt 2 ]; then
  echo "Usage: $0 newContaineName tagVersion"
  exit 1
fi

docker run --name $1 -d cassandra:$2
