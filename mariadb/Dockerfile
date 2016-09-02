FROM phusion/baseimage:0.9.18

ENV \
  HOME /root \
  DEBIAN_FRONTEND noninteractive

RUN \
  rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh && \
  locale-gen en_US.UTF-8 && \
  export LANG=en_US.UTF-8 && \
  apt-get update && \
  apt-get -qy --no-install-recommends --fix-missing --force-yes install wget strace lsof netcat software-properties-common && \
  update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 && \
  apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && \
  sh -c 'echo "deb http://ftp.hosteurope.de/mirror/mariadb.org/repo/10.1/ubuntu trusty main" >> /etc/apt/sources.list.d/mariadb.list' && \
  apt-get update && \
  apt-get install -yq mariadb-server mariadb-client mariadb-common && \
  mkdir -p /etc/my_init.d && \
  mkdir -p /etc/service/mariadb/log/main && \
  apt-get clean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD my_init.d /etc/my_init.d
ADD runit/mariadb /etc/service/mariadb/run
ADD runit/log /etc/service/mariadb/log/run

VOLUME ["/var/lib/mysql","/var/log/mysql"]

EXPOSE 3306

ENV TERM xterm

CMD ["/sbin/my_init"]
