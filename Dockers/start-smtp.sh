#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/docker-remove-stopped-containers.sh
docker run -it --log-driver=syslog --log-opt tag="smtp" --name smtp exim
