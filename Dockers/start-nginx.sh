#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/docker-remove-stopped-containers.sh
$DIR/waituntil.sh php
$DIR/waituntil.sh php54
#$DIR/waituntil.sh btsync
#docker run --rm -t -i -p 80:80 -p 443:443 --link gulp:gulp --link php:php --link php54:php54 --name=nginx -v /www:/www thiru:nginx
docker run --rm -t -i --log-driver=syslog --log-opt tag="nginx" -p 80:80 -p 443:443 --link php:php --link php54:php54 --name=nginx -v /www:/www thiru:nginx
