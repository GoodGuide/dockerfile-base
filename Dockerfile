# vim: set expandtab tabstop=2 shiftwidth=2 softtabstop=2:
FROM ubuntu:15.10

MAINTAINER GoodGuide "docker@goodguide.com"

# Tell Apt never to prompt
ENV DEBIAN_FRONTEND noninteractive

RUN set -x \

 # Set up UTF support
 && locale-gen en_US en_US.UTF-8 \
 && dpkg-reconfigure locales \
 && update-locale LANG=en_US.UTF-8 \

 # Set apt mirror
 && sed 's:archive.ubuntu.com/ubuntu/:mirrors.rit.edu/ubuntu-archive/:' -i /etc/apt/sources.list \

 # never install recommends automatically
 && echo 'Apt::Install-Recommends "false";' > /etc/apt/apt.conf.d/docker-no-recommends \
 && echo 'APT::Get::Assume-Yes "true";' > /etc/apt/apt.conf.d/docker-assume-yes \
 && echo 'APT::Get::AutomaticRemove "true";' > /etc/apt/apt.conf.d/docker-auto-remove \

 # enable backports and others off by default
 && sed 's/^#\s*deb/deb/' -i /etc/apt/sources.list \

 # Enable automatic preference to use backport
 && echo 'Package: *'                      >> /etc/apt/preferences \
 && echo 'Pin: release a=wily-backports'   >> /etc/apt/preferences \
 && echo 'Pin-Priority: 500'               >> /etc/apt/preferences \

 && apt-get update \
 && apt-get upgrade \
 && apt-get install \
       aptitude \
       apt-transport-https \
       bash \
       ca-certificates \
       coreutils \
       curl \
       git \
       gnupg \
       gzip \
       iputils-ping \
       less \
       software-properties-common \
       vim
