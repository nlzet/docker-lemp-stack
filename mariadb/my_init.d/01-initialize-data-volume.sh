#!/bin/bash

if [[ ! -d /var/lib/mysql/mysql ]]; then
  echo "=> Install a fresh data directory"
  mkdir -p /var/lib/mysql
  chown -R mysql:mysql /var/lib/mysql
  /usr/bin/mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
  touch /var/lib/mysql/initialized
else
  echo "=> Use existing data directory. First, fix the permissions of the data directory"
  chown -R mysql:mysql /var/lib/mysql
fi
