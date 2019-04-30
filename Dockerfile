FROM alpine

RUN apk update && apk upgrade
RUN apk add nginx curl

RUN adduser -D -g 'www' www

RUN mkdir /usr/local/www
RUN chown -R www:www /var/lib/nginx \
      && chown -R www:www /usr/local/www

RUN echo $'user                            www; \n\
worker_processes                auto; # it will be determinate automatically by the number of core \n\
\n\
error_log                       /var/log/nginx/error.log warn; \n\
pid                             /var/run/nginx.pid; \n\
\n\
events { \n\
    worker_connections          1024; \n\
} \n\
\n\
http { \n\
    include                     /etc/nginx/mime.types; \n\
    default_type                application/octet-stream; \n\
    sendfile                    on; \n\
    access_log                  /var/log/nginx/access.log; \n\
    keepalive_timeout           3000; \n\
    server { \n\
        listen                  80; \n\
        root                    /usr/local/www; \n\
        index                   index.html index.htm; \n\
        server_name             localhost; \n\
        client_max_body_size    32m; \n\
        error_page              500 502 503 504  /50x.html; \n\
        location = /50x.html { \n\
              root              /var/lib/nginx/html; \n\
        } \n\
    } \n\
}' > /etc/nginx/nginx.conf

RUN cp /var/lib/nginx/html/index.html /usr/local/www/

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
       && ln -sf /dev/stderr /var/log/nginx/error.log

RUN nginx \
      && curl localhost

EXPOSE 80 443

STOPSIGNAL SIGTERM
CMD ["nginx", "-g", "daemon off;"]


