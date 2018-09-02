FROM mysql:5

# better conf
COPY mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

# Set China timezone
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo 'Asia/Shanghai' > /etc/timezone