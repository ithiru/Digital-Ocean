apt-get update
apt-get -y install curl squid
curl -o /etc/squid3/squid.conf http://d.thiru.in/squid.conf
service squid3 restart
