# [Baked AMI, ELB, RDS Backend](https://github.com/stelligent/cloudformation_templates/blob/master/autoscaling/bakedami-elb-rdsbackend.yml)

## Purpose

Create an Autoscaling group in 3 private subnets from a baked AMI, an Elastic Load Balancer in 3 public subnets and S3 ELB Logging Bucket. 
Option to use SSL/TLS on ELB. Option to update Route 53 Hosted DNS alias to point to the ELB.

## Prerequisites
* [VPC](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc.yml)
    * 3 Private Subnets
    * 3 Public Subnets
    * Internal AccessSecurity Group
    * RemoteSecurityGroup
* [RDS](https://github.com/stelligent/cloudformation_templates/blob/master/database)
    * Instance
    * Security Group for RDS Access
* SNS Topic
    
## Optional Prerequisites
* SSL/TLS Certificate uploaded to AWS Account for ELB
* Route53 Hosted Domain

## Summary
1. AWS Service APIs (i.e. CFN Init, ECS, SNS, SES)
2. AWS Linux Package Repos
3. *.rubygems.org
4. *.wordpress.org, *.wordpress.com (Wordpress Updates)
5. docs.google.com (Temp) for Sheets access (Wordpress Plugin)

## Launcher
[![](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png)](https://console.aws.amazon.com/cloudformation/home?#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/bakedami-elb-rdsbackend.yml)<br>

Click this button to open AWS CloudFormation web console to enter parameters and create the stack.


## CloudFormation Template Details
The [CloudFormation Template](https://github.com/stelligent/cloudformation_templates/blob/master/autoscaling/bakedami-elb-rdsbackend.yml) does the following:

1. EC2 Instance Autoscaling LaunchConfiguration
    1. Launches specified AMI ID
    2. 3 Private Subnet
    3. No External IP
2. Security Group
    1. Allow 80 Inbound
    2. Allow 443 Inbound
3. ELB
    1. 3 Public Subnets
    2. SSL/TLS Optional
    3. S3 Logging Optional
    4. Route 53 Update Optional
4. IAM Instance Profile Role
    1. S3 *
    2. ec2:Describe*
    3. elasticloadbalancing:Describe*
    4. autoscaling:Describe*
    5. cloudwatch:*
    6. logs:*
    7. sns:*
