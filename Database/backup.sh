#!/bin/bash

# Define current timestamp
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Define backup file name with timestamp
BACKUP_FILE="/backup/backup_$TIMESTAMP.sql"

# Perform the backup
pg_dump > $BACKUP_FILE

# Upload backup file to S3
aws s3 cp $BACKUP_FILE s3://catchup-session/

# Print success message
echo "Backup completed and uploaded to S3: $BACKUP_FILE"
#  pg_dump -h rudi-db.cwsercbjzvgb.us-east-2.rds.amazonaws.com -p 5432 -U postgres
