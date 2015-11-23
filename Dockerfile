# vim: set expandtab tabstop=2 shiftwidth=2 softtabstop=2:
FROM alpine:3.2

MAINTAINER GoodGuide "docker@goodguide.com"

RUN set -x \
 && apk add --update \
       bash \
       ca-certificates \
       coreutils \
       curl \
       git \
       gnupg \
       gzip \
       less \
       iputils \
       vim \
 && rm -rf /var/cache/apk/*
