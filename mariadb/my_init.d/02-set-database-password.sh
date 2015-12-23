#!/bin/bash
. /etc/container_environment.sh

# DB_ADMIN_PASS="$(cat /etc/mysql/mysql_password 2>/dev/null)"
if [[ -z $DB_ADMIN_PASS ]]; then
	echo "No MariaDB super user password defined!"
	exit 1
fi

# Setup the root user permissions
test -e /var/run/mysqld || install -m 755 -o mysql -g root -d /var/run/mysqld
cat >/var/run/mysqld/grants.sql <<EOF
UPDATE mysql.user SET Password=PASSWORD('${DB_ADMIN_PASS}') WHERE User='root';
GRANT ALL ON *.* to root@'%' IDENTIFIED BY '${DB_ADMIN_PASS}' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF