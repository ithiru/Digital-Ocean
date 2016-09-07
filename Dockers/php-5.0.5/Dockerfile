# Based on ubuntu 14.04
FROM thiru:ubuntu-trusty

MAINTAINER Christian Simon <simon@swine.de>

# Update everything & install prequesites
RUN apt-get update &&  \
    DEBIAN_FRONTEND=noninteractive apt-get -y install build-essential wget bzip2 \
        libpng-dev libmcrypt-dev libmcrypt4 libmhash-dev libmysqlclient-dev libpspell-dev \
        libjpeg-dev zlib1g-dev libfreetype6-dev libfontconfig1-dev libgmp-dev \
        libgpg-error-dev uuid-dev libt1-dev libsnmp-dev libc-client2007e-dev \
        libaspell-dev libbz2-dev libc-client2007e-dev flex bison libsqlite3-dev libpq-dev \
        libcurl4-openssl-dev libmagickwand-dev libgd2-xpm-dev autoconf imagemagick \
        graphicsmagick libdb4.8-dev libtidy-dev libxslt-dev libgeoip-dev libicu-dev spawn-fcgi
RUN apt-get -y install memcached supervisor
RUN DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade && \
    apt-get clean && \
    rm /var/lib/apt/lists/*_*

# Ubuntu Fixes to compile
## Copy libc-client to x86_64-dir
RUN cp /usr/lib/libc-client.so /usr/lib/x86_64-linux-gnu/
RUN cp /usr/lib/libc-client.a /usr/lib/x86_64-linux-gnu/
## Symlink gmp header
RUN ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h

# Download PHP
ENV PHP_VERSION 5.0.5
RUN mkdir -p /tmp/install/ && \
    cd /tmp/install && \
    wget http://museum.php.net/php5/php-${PHP_VERSION}.tar.gz && \
    tar xvfz php-${PHP_VERSION}.tar.gz && \
    cd php-${PHP_VERSION} && \
    ./configure \
        --with-config-file-path=/etc/php5 \
        --with-config-file-scan-dir=/etc/php5/conf.d \
        --with-libdir=lib/x86_64-linux-gnu \
        --with-mcrypt  \
        --with-zlib \
        --with-curl \
        --with-curlwrappers \
        --with-bz2 \
        --with-zlib \
        --with-mhash \
        --with-pcre-regex \
        --with-mysqli  \
        --with-mysql \
        --with-gd \
        --with-imap-ssl \
        --with-ldap \
        --with-mcrypt \
        --with-mhash  \
        --with-snmp=shared \
        --with-freetype-dir=shared,/usr  \
        --with-jpeg-dir=/usr  \
        --with-png-dir \
        --with-t1lib=/usr  \
        --with-bz2 \
        --with-db4 \
        --with-iconv-dir  \
        --with-imap \
        --with-imap-ssl  \
        --with-kerberos \
        --with-openssl \
        --with-gettext \
        --with-pgsql \
        --with-pdo-mysql  \
        --with-tidy \
        --with-xsl \
        --with-gmp \
        --with-pspell \
        --with-xmlrpc \
        --with-libxml-dir=/usr \
        --disable-debug \
        --disable-rpath \
        --disable-fileinfo \
        --enable-cgi \
        --enable-fpm \
        --with-fpm-user=www-data \
        --with-fpm-group=www-data \
        --enable-inline-optimization \
        --enable-magic-quotes \
        --enable-safe-mode \
        --enable-sockets \
        --enable-sysvsem  \
        --enable-sysvshm \
        --enable-pcntl \
        --enable-mbregex \
        --enable-zip  \
        --enable-gd-native-ttf  \
        --enable-ctype \
        --enable-bcmath \
        --enable-ctype \
        --enable-exif \
        --enable-ftp \
        --enable-mbstring \
        --enable-intl \
        --enable-soap  \
        --enable-xml \
        --enable-gd-native-ttf \
        --enable-opcache && \
    make -j 4 && \
    make install && \
    rm -rf /tmp/install

# Create config directory
RUN mkdir -p /etc/php5/conf.d/

# Set location and timestamp
RUN echo "date.timezone=Asia/Kolkata\ndate.default_latitude=49.08\ndate.default_longitude=11.22" > /etc/php5/conf.d/10_timezone.ini

# Enable opcache
#RUN echo "zend_extension=$(php-config --extension-dir)/opcache.so" > /etc/php5/conf.d/20_opcache.ini

RUN pecl install channel://pecl.php.net/imagick-3.2.0RC1
RUN echo "extension=imagick.so" > /etc/php5/conf.d/30_imagick.ini

#RUN pecl install channel://pecl.php.net/mailparse-2.1.6
#RUN echo "extension=mailparse.so" > /etc/php5/conf.d/30_mailparse.ini

RUN pecl install channel://pecl.php.net/geoip-1.0.8
RUN echo "extension=geoip.so" > /etc/php5/conf.d/30_geoip.ini

RUN pecl install channel://pecl.php.net/memcache-3.0.8
RUN echo "extension=memcache.so" > /etc/php5/conf.d/30_memcache.ini

# Install sendmail replacement / set ip address of real mailserver to 172.17.42.1
#RUN mkdir -p /tmp/install/ && \
#    cd /tmp/install && \
#    wget https://github.com/simonswine/mini_sendmail/archive/1.3.8-1.tar.gz  && \
#    tar xvfz 1.3.8-1.tar.gz && \
#    cd mini_sendmail*/ && \
#    make SMTP_HOST=172.17.42.1 && \
#    cp -v mini_sendmail /usr/sbin/sendmail && \
#    rm -rf /tmp/install

ADD php.ini /etc/php5/php.ini
ADD php-fpm.conf /etc/php5/php-fpm.conf

# Test if there is stderr output
RUN bash -c "[[ $(php -i 2>&1 > /dev/null | wc -l) -ne 0 ]] && php -i > /dev/null && exit 1; exit 0"

ADD start.sh /start.sh
ADD docker.conf /etc/supervisor/conf.d/docker.conf
  
CMD ["/start.sh"]
