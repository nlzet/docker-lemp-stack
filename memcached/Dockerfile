FROM phusion/baseimage:latest

ENV \
  HOME /root \
  DEBIAN_FRONTEND noninteractive

RUN \
  rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh && \
  locale-gen en_US.UTF-8 && \
  export LANG=en_US.UTF-8 && \
  apt-get update && \
  apt-get dist-upgrade -y && \
  apt-get install -y memcached  && \
  apt-get clean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD runit/memcached /etc/service/memcached/run

EXPOSE 11211

ENV TERM xterm

CMD ["/sbin/my_init"]
