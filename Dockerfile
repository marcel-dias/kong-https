FROM kong:0.11

ENV KONG_SSL_CIPHER_SUITE=intermediate
ENV KONG_ADMIN_ERROR_LOG=/dev/stderr
ENV KONG_PROXY_ERROR_LOG=/dev/stderr
ENV KONG_ADMIN_ACCESS_LOG=/dev/stdout
ENV KONG_PROXY_ACCESS_LOG=/dev/stdout
ENV KONG_PROXY_LISTEN_SSL=0.0.0.0:443

COPY custom_nginx.template /usr/local/kong/custom_nginx.template

HEALTHCHECK --interval=10s --timeout=3s --start-period=5s --retries=3 \
   CMD [ "test $( curl -Iso /dev/null -w "%{http_code}" "http://localhost:8001/status") -eq 200 || exit 1" ]

CMD ["/usr/local/bin/kong", "start", "--nginx-conf", "/usr/local/kong/custom_nginx.template"]