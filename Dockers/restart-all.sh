docker stop mysql
docker stop php
docker stop php54
docker stop nginx
docker stop smtp
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/docker-remove-stopped-containers.sh
$DIR/start-smtp.sh &
$DIR/start-mariadb.sh &
$DIR/start-php.sh &
$DIR/start-php54.sh &
$DIR/start-nginx.sh &
