#!/bin/bash

# Backup location
BACKUP_TMP_FILE="/tmp/backupdatabase.sh"
BACKUP_FILE_DIR="/var/backups"
BACKUP_FILE="$BACKUP_FILE_DIR/$(date +"%Y-%m-%d_%H-%M")-database.tar.gz"

# Tar options
TAR_OPTIONS="czf"
TAR_FOLDERS="/var/lib/mysql"

echo "=========================================="
echo "Running new backup"
echo "=========================================="
echo "=> Adding default folders"

# Base folders
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
