FROM php:7.1-cli

MAINTAINER twosee <twose@qq.com>

# China timezone
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo 'Asia/Shanghai' > /etc/timezone

# Install modules : GD mcrypt iconv
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        openssl libssh-dev \
        libnghttp2-dev \
        libhiredis-dev \
    && docker-php-ext-install iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

# memcached module  
# RUN apt-get install -y libmemcached-dev unzip
# RUN curl -o /root/memcached.zip https://github.com/php-memcached-dev/php-memcached/archive/php7.zip -L && \
# #RUN curl -o /root/memcached.zip https://github.com/php-memcached-dev/php-memcached/archive/2.2.0.zip -L
#  cd /root && unzip memcached.zip && rm memcached.zip && \
# # cd php-memcached-2.2.0 && \
#  cd php-memcached-php7 && \
#  phpize && ./configure --enable-sasl && make && make install && \
#  cd /root && rm -rf /root/php-memcached-* && \
#  echo "extension=memcached.so" > /usr/local/etc/php/conf.d/memcached.ini  && \
#  echo "memcached.use_sasl = 1" >> /usr/local/etc/php/conf.d/memcached.ini 


# install php pdo_mysql opcache
# WARNING: Disable opcache-cli if you run you php
RUN docker-php-ext-install pdo_mysql mysqli iconv mbstring json mcrypt opcache && \
    echo "opcache.enable_cli=0" >>  /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini

#install redis
RUN pecl install redis && docker-php-ext-enable redis

# install swoole
#TIP: it always get last stable version of swoole coroutine.
RUN cd /root && \
    curl -o /tmp/swoole-releases https://github.com/swoole/swoole-src/releases -L && \
    cat /tmp/swoole-releases | grep 'href=".*v2.*-stable.tar.gz"' | \
    awk -F '"' ' {print "curl -o /tmp/swoole.tar.gz https://github.com"$2" -L" > "/tmp/swoole.download"}' && \
    sh /tmp/swoole.download && \
    tar zxvf /tmp/swoole.tar.gz && rm /tmp/swoole.tar.gz && cd swoole-src* && \
    phpize && \
    ./configure \
    --enable-coroutine \
    --enable-openssl  \
    --enable-http2  \
    --enable-async-redis \
    --enable-mysqlnd && \
    make && make install && \
    docker-php-ext-enable swoole

