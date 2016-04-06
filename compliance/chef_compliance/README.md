# Chef Compliance CloudFormation Template (WIP)

## Purpose
Chef Compliance Webapp Server Setup Template that uses a Chef Compliance AMI provided by Chef.

## Requirements
1. A VPC with a Public Subnet that has internet access
2. An Available EIP
3. AWS Permissions to create IAM roles

## Instructions

### Infrastructure
Setup the following as needed or desired. Obviously you will need permissions to create these items to continue.
1. [VPC](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template)
2. [NAT Gateway](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/nat/natgateway.template) (Optional)
3. [Bastion Host](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/bastion/bastion.template) (Optional)

### Chef Compliance Webapp
1. Run [Chef Compliance Webapp](https://github.com/stelligent/cloudformation_templates/blob/master/compliance/chef_compliance/chef-compliance-webapp.template) CloudFormation Template.
2. SSH to the host and perform an upgrade of both the Chef Compliance system and Chef Marketplace system
    1. ```ssh -i ~/.ssh/my-aws-key.pem ec2-user@x.x.x.x```
    2. ```sudo chef-marketplace-ctl upgrade -y```
    3. ```sudo chef-compliance-ctl restart```
3. Launch Setup Wizard
    1. ```https://ec2-x-x-x-x.us-west-2.compute.amazonaws.com/#/setup```
4. Create user
5. Setup trial Hosted Chef Server Organization
