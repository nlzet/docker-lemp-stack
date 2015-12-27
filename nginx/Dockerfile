FROM phusion/baseimage:latest

ENV \
  HOME /root \
  DEBIAN_FRONTEND noninteractive

RUN \
  rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh && \
  locale-gen en_US.UTF-8 && \
  export LANG=en_US.UTF-8 && \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get dist-upgrade -y && \
  apt-get install -y vim wget curl nano && \
  apt-get install -y ca-certificates nginx && \
  chown -R www-data:www-data /var/lib/nginx && \
  apt-get clean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD runit/nginx /etc/service/nginx/run

VOLUME "/etc/nginx"
VOLUME "/var/log/nginx"

EXPOSE 80 443

ENV TERM xterm

CMD ["/sbin/my_init"]
