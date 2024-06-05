#!/bin/bash

# Variables
BACKUP_DIR="/opt/backup"
BACKUP_DATE="" # Enter Backup Date In /opt/backup To Restore
# Restore Infisical data
sudo docker cp $BACKUP_DIR/backend/backend_backup_$BACKUP_DATE.tar.gz infisical-backend:/tmp
sudo docker exec infisical-backend tar -xzvf /tmp/backend_backup_$BACKUP_DATE.tar.gz -C /

# Restore Redis data
sudo docker cp $BACKUP_DIR/redis/redis_backup_$BACKUP_DATE.rdb infisical-dev-redis:/data/dump.rdb
sudo docker exec infisical-dev-redis redis-cli shutdown save

## Restore PostgreSQL data
sudo docker cp $BACKUP_DIR/db/postgres_backup_$BACKUP_DATE.sql infisical-db:/
sudo docker exec -i infisical-db psql -U infisical -f /postgres_backup_$BACKUP_DATE.sql

## Restart Containers
sudo docker compose -f /opt/infisical/docker-compose.prod.yml down
sudo docker compose -f /opt/infisical/docker-compose.prod.yml up -d                                                  
