#!/bin/bash

# Author: Prashant
# Date: 04-march-2026
# Project: AWS Resource Tracker
# Description: Generate AWS Resource usage report
# Version: v1.0

set -e
set -o

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
OUTPUT_FILE="aws-report-$DATE.txt"

echo "AWS Resource Report - $DATE" > $OUTPUT_FILE
echo "-----------------------------------" >> $OUTPUT_FILE

# List S3 Buckets
echo -e "\nS3 Buckets:" >> $OUTPUT_FILE
aws s3 ls >> $OUTPUT_FILE

# List EC2 Instance IDs
echo -e "\nEC2 Instances:" >> $OUTPUT_FILE
aws ec2 describe-instances \
  | jq -r '.Reservations[].Instances[].InstanceId' >> $OUTPUT_FILE

# List Lambda Functions
echo -e "\nLambda Functions:" >> $OUTPUT_FILE
aws lambda list-functions \
  | jq -r '.Functions[].FunctionName' >> $OUTPUT_FILE

# List IAM Users
echo -e "\nIAM Users:" >> $OUTPUT_FILE
aws iam list-users \
  | jq -r '.Users[].UserName' >> $OUTPUT_FILE

echo -e "\nReport Generated Successfully." >> $OUTPUT_FILE
