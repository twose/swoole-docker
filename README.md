# Swoole-coroutine

[**docker-hub**](https://hub.docker.com/r/twosee/swoole-coroutine/) 

[**github**](https://github.com/twose/swoole-coroutine-docker)

## Usage

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

## Introduction

- 基于最新PHP7.1-cli版本
- 使用swoole2.X最新版本构建,提供各种组合环境["latest", "stable", "memcached"]
- 已安装 ["GD", "mcrypt", "iconv", "pdo_mysql", "dom", "xml", "curl", "swoole"]等PHP扩展
- 已开启["coroutine", "openssl", "http2", "async-redis", "mysqlnd"]扩展
- 纯环境 , 0冗余 , 绿色清洁 , 无任何php代码
- 默认中国上海时区

---

- use swoole 2.* latest stable version
- PHP extension installed: ["GD", "mcrypt", "iconv", "pdo_mysql", "dom", "xml", "curl", "swoole"]
- enable ["coroutine", "openssl", "http2", "async-redis", "mysqlnd"]
- this container has no PHP code or framework included
- Asia/Shanghai timezone default (you can remove it on first RUN line)

## Version

| DIR        | INTRO                                    |
| ---------- | ---------------------------------------- |
| /          | Latest release version                   |
| /stable    | Latest stable release version            |
| /memcached | Latest release version with Memcached installed |

