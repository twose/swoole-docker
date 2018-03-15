FROM php:7.2-cli

MAINTAINER twosee <twose@qq.com>

# Install modules : GD iconv
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        openssl \
        libssh-dev \
        libnghttp2-dev \
        libhiredis-dev \
    && docker-php-ext-install iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

# install php pdo_mysql opcache
# WARNING: Disable opcache-cli if you run you php
RUN docker-php-ext-install pdo_mysql mysqli iconv mbstring json opcache && \
    echo "opcache.enable_cli=0" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini

#install redis
RUN pecl install redis && docker-php-ext-enable redis

# install composer
RUN curl -sS https://getcomposer.org/installer | php && \
mv composer.phar /usr/local/bin/composer && \
composer self-update --clean-backups && \
apt-get install -y zip unzip

# install swoole
#TIP: it always get last stable version of swoole coroutine.
RUN cd /tmp && \
    curl -o /tmp/swoole.tar.gz https://github.com/swoole/swoole-src/archive/1.9.tar.gz -L && \
    tar zxvf /tmp/swoole.tar.gz && cd swoole-src* && \
    phpize && \
    ./configure \
    --enable-openssl  \
    --enable-http2  \
    --enable-async-redis \
    --enable-mysqlnd && \
    make && make install && \
    docker-php-ext-enable swoole && \
    echo "swoole.fast_serialize=On" >> /usr/local/etc/php/conf.d/docker-php-ext-swoole-serialize.ini && \
    rm -rf /tmp/*

# memcached module  
RUN apt-get install -y libmemcached-dev && \
 curl -o /tmp/memcached.tar.gz https://github.com/php-memcached-dev/php-memcached/archive/php7.tar.gz -L && \
 cd /root && tar zxvf /tmp/memcached.tar.gz && \
 cd php-memcached-php7 && \
 phpize && ./configure --enable-sasl && make && make install && \
 cd /root && rm -rf /root/php-memcached-* && \
 echo "extension=memcached.so" > /usr/local/etc/php/conf.d/memcached.ini  && \
 echo "memcached.use_sasl=1" >> /usr/local/etc/php/conf.d/memcached.ini

# set China timezone
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo 'Asia/Shanghai' > /etc/timezone && \
    echo "[Date]\ndate.timezone=Asia/Shanghai" > /usr/local/etc/php/conf.d/timezone.ini