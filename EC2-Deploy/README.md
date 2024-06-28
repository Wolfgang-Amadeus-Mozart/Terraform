# Creating An EC2 instance

This little project will teach how to deploys and ec2 instance from terraform

You have to consider that, a few were already created previously, such as VPC and subnet, and there information were in a remote state file stored in an AWS s3 bucket
This project get information from this remote state file to specify which VPC and subnet will be used