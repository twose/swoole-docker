## Usage

```Bash
docker run -d --name=swoole -v /workdir:/workdir -p 9501:9501 \
 php /app/server.php start
```

· use swoole 2.* latest stable version
· enable ["coroutine", "openssl", "http2", "async-redis", "mysqlnd"]
· this container has no PHP code or framework included
· PHP extension installed: ["GD", "mcrypt", "iconv", "pdo_mysql", "dom", "xml", "curl", "swoole"]