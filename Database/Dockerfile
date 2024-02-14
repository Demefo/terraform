# Use official PostgreSQL image as the base
FROM postgres:latest

# Install necessary tools
RUN apt-get update && apt-get install -y postgresql-client-15  awscli

# Set environment variables
ENV PGHOST='db-postgresql-nyc3-26515-do-user-12198957-0.c.db.ondigitalocean.com'
ENV PGUSER='doadmin'
ENV PGPASSWORD='AVNS_HkmaatXJL1QfH60HmnZ'
ENV PGDATABASE='s6-user'
ENV AWS_ACCESS_KEY_ID=AKIAZI2LE2Z6CLDSGQZ7
ENV AWS_SECRET_ACCESS_KEY=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
ENV AWS_DEFAULT_REGION='us-east-1'
ENV PGPORT=25060
ENV PGSSLMODE=require
#create the path for the backup
RUN mkdir -p /backup
# Copy backup script into container
COPY backup.sh /usr/local/bin/backup.sh

# Grant execution permissions to the script
RUN chmod +x /usr/local/bin/backup.sh

# Define entry point
CMD ["backup.sh"]
