#!/bin/bash
NAME=$1
if [ -z "${NAME}" ];then
  echo 'Key name missing. Include argument for key name (eg: aws-admin)'
  exit 1
fi
  
aws ec2 create-key-pair --key-name ${NAME} --query 'KeyMaterial' --output text > ~/.ssh/${NAME}.pem
chmod 400 ~/.ssh/${NAME}.pem
ls -hal ~/.ssh/${NAME}.pem
aws ec2 describe-key-pairs --key-name ${NAME}
