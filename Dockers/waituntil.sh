running=$(docker ps | grep $1 | wc -l)
while [ $running -eq 0 ]; do
  running=$(docker ps | grep $1 | wc -l)
  sleep 1s
done
