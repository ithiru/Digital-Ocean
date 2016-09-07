#!/bin/bash
docker rm $(docker ps -a -q) 1> /dev/null 2>&1
