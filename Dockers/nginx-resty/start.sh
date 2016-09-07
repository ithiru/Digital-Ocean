#!/bin/bash
if [ ! -f /www/.configured ]; then

  rm -Rf /www/conf/nginx
  cp -Rf --preserve=links /opt/www/* /www/
  touch /www/.configured
fi

chown -R www-data:www-data /www
/opt/openresty/nginx/bin/nginx
