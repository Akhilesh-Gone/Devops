#!/bin/bash
#author : Akhilesh
# date :9 nov 24
# file : tracks the resources used by vm
set -x
aws s3 ls > file.txt
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> file.txt
aws lambda list-functions >> file.txt
aws iam list-users >> file.txt
