# Chef Compliance Lab CloudFormation Templates (WIP)

## Purpose
Chef Compliance Webapp Server Setup Template that uses a Chef Compliance AMI provided by Chef.

## Setup Instructions
Run each of the following CloudFormation templates in order as needed to setup the Chef Compliance Lab.
Look at the VPC CloudFormation output for any needed values for the other template parameters.

1. Setup [VPC](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template) if needed.
2. Setup [NAT Gateway](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/nat/natgateway.template) if needed.
3. Setup [Bastion Host](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/bastion/bastion.template) if needed.
4. Run [Chef Compliance Webapp](https://github.com/stelligent/cloudformation_templates/blob/master/compliance/chef_compliance/chef-compliance-webapp.template) CloudFormation Template.
5. SSH to the host and perform an upgrade of both the Chef Compliance system and Chef Marketplace system
    1. ```ssh -i ~/.ssh/my-aws-key.pem ec2-user@x.x.x.x```
    2. ```sudo chef-marketplace-ctl upgrade -y```
    3. ```sudo chef-compliance-ctl restart```
6. Launch Setup Wizard
    1. ```https://ec2-x-x-x-x.us-west-2.compute.amazonaws.com/#/setup```
7. Create user
8. Setup trial Hosted Chef Server Organization
