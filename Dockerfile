FROM ubuntu:14.04

MAINTAINER GoodGuide "docker@goodguide.com"

# Tell Apt never to prompt
ENV DEBIAN_FRONTEND noninteractive

# this forces dpkg not to call sync() after package extraction and speeds up install
RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup

# we don't need apt cache in a container
RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache

RUN locale-gen en_US en_US.UTF-8 \
 && dpkg-reconfigure locales

RUN apt-get update \
 && apt-get install -y aptitude \
 && apt-get clean

RUN aptitude install --without-recommends --assume-yes \
      build-essential \
      ca-certificates \
      curl \
      git \
      htop \
      iputils-ping \
      ssh-client \
      vim \
 && aptitude clean

ONBUILD RUN aptitude update
