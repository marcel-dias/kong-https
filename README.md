# Kong API Gateway Docker Image

This is a [Kong](https://getkong.org) based image with a Nginx server to redirect requests to the https port.

Basically it adds the Nginx server configuration below with a 301 redirect to https port.

```nginx
server {
    listen 8080;
    server_name localhost;
    return 301 https://$host$request_uri;
}
```

It also set the following properties to Kong:

```bash
- KONG_SSL_CIPHER_SUITE=intermediate
- KONG_ADMIN_ERROR_LOG=/dev/stderr
- KONG_PROXY_ERROR_LOG=/dev/stderr
- KONG_ADMIN_ACCESS_LOG=/dev/stdout
- KONG_PROXY_ACCESS_LOG=/dev/stdout
- KONG_PROXY_LISTEN_SSL=0.0.0.0:443
```
