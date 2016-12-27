#!/bin/sh
#SET Directory to back up to S3
webroot="/var/www/html/"
#S3 bucket name
bucket="mybucket"

file="backup-$(date +%F).tar.gz"
backup="$webroot$file"
if [ -d $webroot ]
then
    cd $webroot
    tar -czf "$file" -C "$webroot" .
    if [ -f $backup ]
    then
        echo "created backup file $backup"
        aws s3 cp "$backup" "s3://$bucket/backups/$file" --acl private
        echo "uploaded backup file to S3 Bucket $bucket/backups"
        rm "$backup"
    else
        echo "error creating backup"
        exit 1
    fi
else
    echo "webroot specified directory doesn't exist"
    exit 1
fi
exit 0
