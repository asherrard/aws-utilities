## Requirements
- Install AWS CLI `apt-get install awscli`
- Set a valid aws cli region via   `aws configure` 
    * see http://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region
- Ensure you have proper S3 Bucket permissions   
## Configuration
- Update the file with your own  `webroot` directory  and S3 `bucket` name
- Edit or create your crontab to run 
    * `0 1 * * * /var/www/html/s3backup.sh`
