#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/docker-remove-stopped-containers.sh
$DIR/waituntil.sh mysql 
docker run --rm -t -i --link mysql:mysql -v /www:/www thiru:run
