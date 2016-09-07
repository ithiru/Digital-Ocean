#!/bin/bash
STATUSCODE=$(curl --max-time 30 --silent --output /dev/stderr --write-out "%{http_code}" http://d.thiru.in/index.php)

if test $STATUSCODE -ne 200; then
echo "The site is down"
./restart-php.sh
fi;
