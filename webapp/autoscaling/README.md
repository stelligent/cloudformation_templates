# Auto Scale Group Behind ELB CloudFormation Template

## Purpose
Create an Autoscaling group in 3 private subnets, an Elastic Load Balancer in 3 public subnets and S3 Logging Bucket.
Setup to use SSL/TLS port 443 on ELB. Plus it updated Route 53 Hosted DNS alias to point to the ELB.

This can be used for a baked AMI webapp for deployment through the AWS Console or CLI tools.

I wrote it to stand up a Mediawiki web server autoscaling group based on baked AMI and a MySQL RDS setup by another template.

It's more of an example than anything. So grab it and customize all you want.


## Requirements
* VPC
* 3 Private Subnets
* 3 Public Subnets
* AMI
* SSL Cert uploaded to AWS console
* Route 53 Hosted Zone
* NAT Security Group
* RDS Security Group
* Internal Access Security Group

## Setup Instructions
Either deploy the asg-elb-ssl-s3logs.template to a current environment that meets the above requirements or build an environment with the templates listed below.

1. [VPC Template](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template)
2. [NAT Gateway Template](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/nat/nat-gateway.template) (Optional)
3. [Bastion Host Template](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/bastion/bastion.template) (Optional)
4. [Baked AMI ASG Webapp Template](https://github.com/stelligent/cloudformation_templates/blob/master/webapp/autoscaling/bakedami.template)
