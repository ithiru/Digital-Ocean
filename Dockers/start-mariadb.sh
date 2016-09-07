#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/docker-remove-stopped-containers.sh
docker run --rm -t -i --name=mysql --log-driver=syslog --log-opt tag="mysql" --env-file=/root/dockers/mariadb/mysql.env -v /data/mariadb:/var/lib/mysql thiru:mariadb
