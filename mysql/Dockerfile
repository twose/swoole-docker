FROM mysql

RUN mkdir -p \
    /var/lib/mysql \
    /var/run/mysqld && \
    chown mysql /var/lib/mysql && \
    chown mysql /var/run/mysqld

COPY mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo 'Asia/Shanghai' > /etc/timezone
