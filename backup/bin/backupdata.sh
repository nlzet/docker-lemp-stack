#!/bin/bash

# Backup location
BACKUP_TMP_FILE="/tmp/backupdata.sh"
BACKUP_FILE_DIR="/var/backups"
BACKUP_FILE="$BACKUP_FILE_DIR/$(date +"%Y-%m-%d_%H-%M")-data.tar.gz"

# Tar options
TAR_FOLDERS="/var/www/"
TAR_OPTIONS="czf"

if [ -d "/var/log/nginx" ]; then
    TAR_FOLDERS="$TAR_FOLDERS /var/log/nginx"
fi
if [ -d "/var/log/mysql" ]; then
    TAR_FOLDERS="$TAR_FOLDERS /var/log/mysql"
fi
if [ -d "/var/log/syslog" ]; then
    TAR_FOLDERS="$TAR_FOLDERS /var/log/syslog"
fi
if [ -d "/var/log/php" ]; then
    TAR_FOLDERS="$TAR_FOLDERS /var/log/php"
fi

echo "=========================================="
echo "Running new backup"
echo "=========================================="
echo "=> Adding default folders"

COMMAND="${TAR_OPTIONS} ${BACKUP_FILE} ${TAR_FOLDERS}"
echo "tar ${COMMAND}" > ${BACKUP_TMP_FILE}

echo "=========================================="
echo "=> Folders:         ${TAR_FOLDERS}"
echo "=> Destination:     ${BACKUP_FILE}"
echo "=> Options:         ${TAR_OPTIONS}"
echo "=========================================="
echo "=> Command:         tar ${COMMAND}"
echo "=> Tar with temp file ${BACKUP_TMP_FILE}"

chmod +x ${BACKUP_TMP_FILE}
${BACKUP_TMP_FILE}
rm ${BACKUP_TMP_FILE}

echo "=> Done"
echo "=========================================="
