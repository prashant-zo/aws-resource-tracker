# AWS Resource Tracker

A simple DevOps automation project that tracks AWS resource usage using Bash scripting and AWS CLI.

This project demonstrates how to automate cloud resource monitoring by collecting information about commonly used AWS services and generating a report file.

The script runs on an EC2 instance and uses AWS CLI commands to retrieve resource details, processes JSON output using `jq`, and stores the results in a readable report file.

This project is useful for understanding cloud automation and monitoring practices used by DevOps engineers.

---

## Project Overview

In many organizations, developers create cloud resources such as EC2 instances, S3 buckets, Lambda functions, and IAM users. Over time some of these resources may remain unused but still incur costs.

This script helps track AWS resources and generate a report of the current infrastructure state.

The report can be generated manually or scheduled automatically using a cron job.

---

## Technologies Used

- Bash Scripting  
- AWS CLI  
- jq (JSON parser)  
- Linux Cron Jobs  
- AWS EC2  
- AWS IAM  

---

## AWS Services Monitored

The script retrieves information about the following AWS resources:

- EC2 Instances  
- S3 Buckets  
- Lambda Functions  
- IAM Users  

---

## Architecture

EC2 Instance  
↓  
Bash Script (resource-tracker.sh)  
↓  
AWS CLI Commands  
↓  
AWS API Calls  
↓  
JSON Output  
↓  
Parsed using jq  
↓  
Resource Report Generated  

---

## Prerequisites

Before running the project, ensure the following:

- AWS Account  
- EC2 Ubuntu instance  
- IAM Role attached to EC2  
- AWS CLI installed  
- jq installed  
- Git installed  

---

## Setup Instructions

### 1. Launch an EC2 Instance

Launch an Ubuntu EC2 instance from the AWS console.

Recommended configuration:

Instance type: t2.micro

---

### 2. Install Required Tools

Update packages:

sudo apt update

Install required tools:

sudo apt install unzip jq git -y

Install AWS CLI v2:

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"  
unzip awscliv2.zip  
sudo ./aws/install  

Verify installation:

aws --version  
jq --version  

---

### 3. Attach IAM Role to EC2

Create an IAM Role with the following policies:

- AmazonEC2ReadOnlyAccess  
- AmazonS3ReadOnlyAccess  
- IAMReadOnlyAccess  
- AWSLambda_ReadOnlyAccess  

Attach this role to the EC2 instance.

This allows the script to securely access AWS resources without storing credentials.

---

### 4. Clone Repository

Clone the project repository:

git clone https://github.com/YOUR_USERNAME/aws-resource-tracker.git  
cd aws-resource-tracker  

---

### 5. Make Script Executable

chmod +x resource-tracker.sh  

---

### 6. Run the Script

Execute the script:

./resource-tracker.sh  

After running the script, a report file will be generated.

Example:

report-2026-03-04_18-00-00.txt

---

## Example Output

AWS Resource Report

S3 Buckets:  
example-bucket  

EC2 Instances:  
i-0abcd12345  

Lambda Functions:  
image-processing-function  

IAM Users:  
admin  
developer  

---

## Automating the Script using Cron

To run the script automatically every day, use a cron job.

Open cron editor:

crontab -e

Add the following line to run the script daily at 6 PM:

0 18 * * * /home/ubuntu/aws-resource-tracker/resource-tracker.sh

This will generate a daily AWS resource usage report automatically.

---

## Learning Outcomes

This project demonstrates:

- AWS CLI usage for infrastructure monitoring  
- Bash scripting automation  
- Parsing AWS JSON responses using jq  
- Automating tasks with cron jobs  
- Secure authentication using IAM roles  
- Running automation inside a cloud environment  

---

## Future Improvements

Possible improvements for this project:

- Monitor additional AWS services  
- Send report notifications via email  
- Upload reports to S3  
- Add logging and error handling  
- Build a monitoring dashboard.

---

## Author

Prashant  
