docker images -a | grep none | awk '{print $3}' | xargs -L 1 -r docker rmi
