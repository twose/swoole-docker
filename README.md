## Swoole-coroutine

[**docker-hub**](https://hub.docker.com/r/twosee/swoole-coroutine/) 

[**github**](https://github.com/twose/swoole-coroutine-docker)

### Usage

```Bash
docker pull twosee/swoole-coroutine
```

```Bash
docker run -d --name=swoole \
 -v /workdir:/workdir \
 -p 9501:9501 \
 twosee/swoole-coroutine \
 php /app/server.php start
```

### Introduction

- 基于最新PHP7.2-cli版本
- 使用swoole2.X最新版本构建,提供各种组合环境["latest", "stable", "memcached"]
- 已安装 ["GD", "iconv", "pdo_mysql", "dom", "xml", "curl", "swoole"]等PHP扩展
- 已开启["coroutine", "openssl", "http2", "async-redis", "mysqlnd"]扩展
- 纯环境 , 0冗余 , 绿色清洁 , 无任何php代码
- 默认中国上海时区

---

- use swoole 2.* latest stable version
- PHP extension installed: ["GD", "iconv", "pdo_mysql", "dom", "xml", "curl", "swoole"]
- enable ["coroutine", "openssl", "http2", "async-redis", "mysqlnd"]
- this container has no PHP code or framework included
- Asia/Shanghai timezone default (you can remove it on last RUN line)

### Version

| DIR        | INTRO                                    | Tag       |
| ---------- | ---------------------------------------- | --------- |
| /master    | Latest master version (Experimental type) | latest    |
| /release   | Latest release version                   | release   |
| /stable    | Latest stable release version            | stable    |
| /memcached | Latest release version with Memcached installed | memcached |
| /1.9       | Latest version from branch 1.9.x         | 1.9       |
| /mysql     | It's a MySQL's docker                    | mysql     |



### Docker-compose

Swoole + mysql

```yaml
version: '3.4'
services:
  swoole:
    image: "twosee/swoole-coroutine"
    ports:
      - "127.0.0.1:9501:9501"
    volumes:
      - ./src:/app/src:rw
    restart: always
    depends_on:
      - mysql
    command: php /app/src/server.php

  mysql:
    image: "twosee/swoole-coroutine:mysql"
    ports:
      - "127.0.0.1:3306:3306"
    volumes:
      - ./data/mysql/data:/var/lib/mysql:rw
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: forTest
      MYSQL_DATABASE: test
      MYSQL_USER: php
      MYSQL_PASSWORD: forTest
```
You can see [mysqld.cnf](https://github.com/twose/swoole-coroutine-docker/tree/master/mysql).

```php
$options = [
  'host'     => 'test', //So there.
  'port'     => 3306,
  'user'     => 'php',
  'password' => 'forTest',
  'database' => 'custed'
];
$db = new \Swoole\Coroutine\Mysql();
$db->connect($options);
```

