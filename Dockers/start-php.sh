#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/docker-remove-stopped-containers.sh
$DIR/waituntil.sh mysql
$DIR/waituntil.sh smtp
#swapon /swapfile
docker run --rm -t -i --log-driver=syslog --log-opt tag="php" --name=php --link smtp:smtp --link mysql:mysql -v /www:/www thiru:php
