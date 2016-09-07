#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/docker-remove-stopped-containers.sh
docker run --rm -t -i --name=mysql --env-file=/root/dockers/mysql/mysql.env -v /data/mysql:/var/lib/mysql thiru:mysql
