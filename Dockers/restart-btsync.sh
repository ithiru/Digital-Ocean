#!/bin/bash
docker stop btsync
docker stop nginx
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/docker-remove-stopped-containers.sh
./start-btsync.sh &
./start-nginx.sh &
