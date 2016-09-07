FROM thiru:ubuntu-trusty

# Install packages
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install squid

# memcached public variable 
ADD squid.conf /etc/squid3/squid.conf
CMD ["/usr/sbin/squid3", "-N"]
