#!/bin/bash

# Variables
BACKUP_DIR="/opt/backup"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Backup Infisical data
sudo docker exec infisical-backend tar -cvzf /tmp/backend_backup_$TIMESTAMP.tar.gz /backend
docker cp infisical-backend:/tmp/backend_backup_$TIMESTAMP.tar.gz $BACKUP_DIR/backend/backend_backup_$TIMESTAMP.tar.gz
sudo docker exec infisical-backend rm /tmp/backend_backup_$TIMESTAMP.tar.gz

# Backup Redis data
docker exec infisical-dev-redis redis-cli SAVE
docker cp infisical-dev-redis:/data/dump.rdb $BACKUP_DIR/redis/redis_backup_$TIMESTAMP.rdb

# Backup PostgreSQL data
docker exec infisical-db pg_dumpall -U infisical > $BACKUP_DIR/db/postgres_backup_$TIMESTAMP.sql

# Delete old backups (optional)
# find $BACKUP_DIR -type f -name "*.tar.gz" -mtime +7 -delete

