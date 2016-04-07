# Chef Compliance CloudFormation Template (WIP)

## Purpose
Chef Compliance Webapp Server Setup Template that uses a Chef Compliance AMI provided by Chef.

## Supported Regions
* us-west-2
* us-east-1

## Requirements
1. A VPC with a Public Subnet that has internet access
2. An Available EIP
3. AWS Permissions to create IAM roles
4. EC2 Key Pair Setup

## Instructions

### Infrastructure
Setup the following as needed or desired. Obviously you will need permissions to create these items to continue.

1. [VPC](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template)
2. [NAT Gateway](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/nat/nat-gateway.template) (Optional)
3. [Bastion Host](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/bastion/bastion.template) (Optional - WIP if I add tcp22 to SG)

### Chef Compliance Webapp

1. Run [Chef Compliance Webapp](https://github.com/stelligent/cloudformation_templates/blob/master/compliance/chef_compliance/chef-compliance-webapp.template) CloudFormation Template.
2. Wait 15 minutes for initialization to complete
    1. Part of the bootstrap in the CloudFormation is to upgrade the Chef Compliance and Chef Marketplace packages. Be sure to check the ```/var/log/cloud-init.log``` to see that it upgraded correctly if you notice a problem with the setup wizard.
        1. How to Manually upgrade
            1. ```ssh -i ~/.ssh/my-aws-key.pem ec2-user@x.x.x.x```
            2. ```sudo chef-marketplace-ctl upgrade -y```
            3. ```sudo chef-compliance-ctl restart```
4. Launch Setup Wizard
    1. ```https://ec2-x-x-x-x.us-west-2.compute.amazonaws.com/#/setup```
5. Create user
6. Setup trial Hosted Chef Server Organization
