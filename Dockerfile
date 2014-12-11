FROM ubuntu:14.10

MAINTAINER Yury Borunov <yury@borunov.com>

# Install OS.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential software-properties-common python-software-properties && \
  apt-get install -y byobu curl git htop man unzip vim wget sudo nano && \
  rm -rf /var/lib/apt/lists/* && \
  locale-gen en_US.UTF-8 

# Keep upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive