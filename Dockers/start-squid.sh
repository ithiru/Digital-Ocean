#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/docker-remove-stopped-containers.sh
$DIR/waituntil.sh mysql
#swapon /swapfile
docker run --rm -t -i -p 7624:7624 thiru:squid3
