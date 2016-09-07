#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/docker-remove-stopped-containers.sh
#docker run --rm -t -i --name=btsync --net="host" -p 55555:55555 -v /www:/www -v /root/btsync:/btsync thiru:btsync-v3
docker run --rm -t -i --name=btsync -p 55555:55555 -v /www:/www -v /root/btsync:/btsync thiru:btsync-v3
