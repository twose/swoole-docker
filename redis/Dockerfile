FROM redis:4

RUN mkdir -p \
    /var/lib/redis \
    /var/run/redis && \
    chown redis /var/lib/redis && \
    chown redis /var/run/redis

COPY redis.conf /usr/local/etc/redis/redis.conf

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]

RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo 'Asia/Shanghai' > /etc/timezone
