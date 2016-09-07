docker stop mysql
docker stop php
docker stop nginx
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/docker-remove-stopped-containers.sh
swapoff
$DIR/start-mariadb.sh &
$DIR/start-php.sh &
$DIR/start-nginx.sh &

