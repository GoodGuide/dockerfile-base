# vim: set expandtab tabstop=2 shiftwidth=2 softtabstop=2:
FROM {{BASE_IMAGE}}

MAINTAINER GoodGuide "docker@goodguide.com"

RUN apk add --update bash \
 && rm -rf /var/cache/apk/*

COPY script/default_shell.sh /usr/local/bin/default_shell
SHELL ["/usr/local/bin/default_shell"]

RUN apk add --update \
       ca-certificates \
       coreutils \
       curl \
       git \
       gnupg \
       gzip \
       less \
       iputils \
       vim \

 # Add default app user
 && mkdir /app \
 && adduser -HDG users -h /app -s /bin/bash -g 'App runtime user' app

COPY script/gg_health_docker_healthcheck.sh /usr/local/bin/gg_health_check
COPY etc/ /etc/
RUN ln -sf /etc/bashrc /root/.bashrc \
 && ln -sf /etc/bashrc /app/.bashrc

CMD ["/bin/bash"]
