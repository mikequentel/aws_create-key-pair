#!/bin/bash
NAME=$1
if [ -z "${NAME}" ];then
  echo 'Key name missing. Include argument for key name (eg: aws-admin)'
  exit 1
fi
  
aws ec2 create-key-pair --key-name ${NAME} --query 'KeyMaterial' --output text > ~/.ssh/${NAME}.pem
ls -hal ~/.ssh/*.pem
