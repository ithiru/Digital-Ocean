#
# Dockerfile - Basic Auth REST Service using Lua Script in NGinx
#
FROM thiru:ubuntu-trusty
MAINTAINER Thirumalai Veerasamy <techy@thiru.in>

# Open Resty Dependencies
RUN apt-get update && apt-get -y upgrade \
    && apt-get install -y curl build-essential libreadline6-dev ncurses-dev \
    libpcre++-dev libssl-dev libgeoip-dev libxml2-dev libxslt-dev libgd2-xpm-dev \
    libperl-dev aptitude net-tools iputils-ping

# OpenResty
ENV SRC_DIR /opt
ENV OPENRESTY_VERSION 1.7.2.1
ENV OPENRESTY_PREFIX /opt/openresty

#PageSpeed Module
ENV NGX_PAGESPEED_VERSION 1.9.32.2

RUN cd $SRC_DIR \
    && curl -LO http://openresty.org/download/ngx_openresty-$OPENRESTY_VERSION.tar.gz \
    && curl -LO https://github.com/pagespeed/ngx_pagespeed/archive/v$NGX_PAGESPEED_VERSION-beta.tar.gz \
    && curl -LO https://dl.google.com/dl/page-speed/psol/${NGX_PAGESPEED_VERSION}.tar.gz

RUN cd $SRC_DIR \
    && tar xzf v$NGX_PAGESPEED_VERSION-beta.tar.gz \
    && tar xzf ngx_openresty-$OPENRESTY_VERSION.tar.gz \
    && cd $SRC_DIR/ngx_pagespeed-$NGX_PAGESPEED_VERSION-beta \
    && tar xzf ../$NGX_PAGESPEED_VERSION.tar.gz

RUN cd $SRC_DIR/ngx_openresty-$OPENRESTY_VERSION \
  && ./configure --prefix=$OPENRESTY_PREFIX \
 --user=www-data \
 --group=www-data \
 --sbin-path=$OPENRESTY_PREFIX/nginx/bin/nginx \
 --pid-path=/tmp/openresty.pid \
 --lock-path=/tmp/openresty.lock \
 --conf-path=/www/conf/nginx/nginx.conf \
 --with-file-aio \
 --with-ipv6 \
 --with-http_realip_module \
 --with-http_addition_module \
 --with-http_xslt_module \
 --with-http_image_filter_module \
 --with-http_geoip_module \
 --with-http_sub_module \
 --with-http_dav_module \
 --with-http_flv_module \
 --with-http_iconv_module \
 --with-http_gzip_static_module \
 --with-http_random_index_module \
 --with-http_secure_link_module \
 --with-http_degradation_module \
 --with-http_stub_status_module \
 --with-http_perl_module \
 --with-pcre --with-pcre-jit --with-md5-asm --with-sha1-asm \
 --with-http_spdy_module \
 --with-http_ssl_module \
 --http-client-body-temp-path=/tmp/openresty_client_body_temp \
 --http-proxy-temp-path=/tmp/openresty_proxy_temp \
 --http-fastcgi-temp-path=/tmp/openresty_fastcgi_temp \
 --add-module=$SRC_DIR/ngx_pagespeed-$NGX_PAGESPEED_VERSION-beta \
 && make \
 && make install \
 && rm -rf ngx_openresty-$OPENRESTY_VERSION*

ADD start.sh /start.sh
ADD www /opt/www

# Unset ENV
RUN unset SRC_DIR OPENRESTY_VERSION OPENRESTY_PREFIX

# Port
EXPOSE 80

VOLUME /www

CMD ["/start.sh"]
