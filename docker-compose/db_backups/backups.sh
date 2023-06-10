#!/bin/bash

# Timestamp for the backup filename
TIMESTAMP=$(date +%Y%m%d%H%M%S)

# Database credentials ||||  just copy from .env

DB_HOST=db
DB_DATABASE=project_2
DB_USERNAME=admin
DB_PASSWORD=admin

# Backup directory
BACKUP_DIR=./backup/

# Create the backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Backup filename
BACKUP_FILE=$BACKUP_DIR/$DB_DATABASE$TIMESTAMP.sql

# Run the backup command
docker-compose exec -T db mysqldump -h $DB_HOST -u $DB_USERNAME -p$DB_PASSWORD $DB_DATABASE > $BACKUP_FILE

# Print backup completion message
echo "Database backup completed: $BACKUP_FILE"

# to exec this file from terminal of root folder/project run :    cd docker-compose/db_backups &&  ./backups.sh
