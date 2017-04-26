FROM kreable/php70

USER root

RUN cat /etc/*-release
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update

# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/cache/oracle-jdk8-installer

RUN apt-get install -y oracle-java8-set-default
RUN apt-get install -y firefox xvfb

RUN wget -O /root/selenium.jar http://selenium-release.storage.googleapis.com/3.4/selenium-server-standalone-3.4.0.jar
