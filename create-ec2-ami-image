
#!/usr/bin/env bash

#
# @Purpose              Creates an image (AMI) of the given EC2 instance
# @Background   Meant to be run as a cronjob. Requires that awscli is installed. Assumes that the
# instance running this command has the permission ec2:CreateImage assigned via IAM.
#
# @Usage:               ec2-create-image <instance-id>
#
owner=000000000000 
#Amazon IAN EC2 User ARN
DATE=$(date +%Y-%m-%d_%H-%M)
AMI_NAME="Backup - $DATE"
AMI_DESCRIPTION="Website Magento Backup - $DATE"
INSTANCE_ID=$(curl -s 'http://169.254.169.254/latest/meta-data/instance-id')

printf "Requesting AMI for instance $INSTANCE_ID...\n"
aws ec2 create-image --instance-id $INSTANCE_ID --name "$AMI_NAME" --description "$AMI_DESCRIPTION" --no-reboot

if [ $? -eq 0 ]; then
        printf "AMI request complete!\n"
fi

## find previous AMI
##aws ec2 describe-images --filter "Name=is-public,Values=false" --owners "$owner"
