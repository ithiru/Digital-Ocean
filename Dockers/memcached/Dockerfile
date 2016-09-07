FROM thiru:ubuntu-trusty
MAINTAINER  Sylvain Lasnier <sylvain.lasnier@gmail.com>

# Install packages
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install memcached

# memcached public variable 

CMD ["/usr/bin/memcached", "-u", "memcache", "-v"]
