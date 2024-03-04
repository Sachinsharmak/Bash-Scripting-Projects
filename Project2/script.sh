#!/bin/bash

######################
#Author: Sachin
#Date: 01/03/2024
#Topic: Script to report the Usages of AWS Cloud Products(EC2,S3,Lambda,IAM) in Your Project
######################

set -x

# list s3 buckets
echo "Print list of S3 Buckets"
aws s3 ls >> ResourceTracker

# list EC2 instance
echo "Print list of EC2 Instances"
aws ec2 describe-instances >> ResourceTracker

# list lambda
echo "Print list of lambda Functions"
aws lambda list-functions >> ResourceTracker

# list IAM Users
echo "Print IAM Users"
aws iam list-users >> ResourceTracker
