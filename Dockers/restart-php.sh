docker stop php
docker stop php54
docker stop nginx
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/start-php.sh &
$DIR/start-php54.sh &
$DIR/start-nginx.sh &
