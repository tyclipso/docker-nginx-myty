FROM ubuntu:18.04
MAINTAINER Benjamin Brandt <benjamin.brandt@tyclipso.net>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
        nginx-extras \
    && apt-get autoremove --purge -y \
        xauth \
    && rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/
COPY myty.conf /etc/nginx/conf.d/

RUN echo "upstream php-upstream { server php:9001; }" > /etc/nginx/conf.d/upstream.conf

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
