#!/bin/bash

if [ $# -lt 3 ]; then
  echo "Usage: $0 newContaineName tagVersion existingSeedContainerName"
  exit 1
fi

$ docker run --name $1 -d -e CASSANDRA_SEEDS="$(docker inspect --format='{{ .NetworkSettings.IPAddress }}' ${3})" cassandra:$2