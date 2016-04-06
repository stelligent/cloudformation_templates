# Chef Compliance Lab CloudFormation Templates

## Purpose
Chef Compliance Lab Setup that uses a Chef Compliance AMI provided by Chef.

## Supported Regions
* us-west-2
* us-east-1

## Setup Instructions
Run each of the following CloudFormation templates in order as needed to setup the Chef Compliance Lab.
Look at the VPC CloudFormation output for any needed values for the other template parameters.

1. [VPC](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template)
2. [NAT Gateway](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/nat/nat-gateway.template) (Optional)
3. [Bastion Host](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/bastion/bastion.template) (Optional - WIP if I add tcp22 to CC SG)
4. [Chef Compliance Webapp](https://github.com/stelligent/cloudformation_templates/blob/master/compliance/chef_compliance/chef-compliance-webapp.template)
5. [Chef Compliance Lab Test Instances](https://github.com/stelligent/cloudformation_templates/blob/master/labs/chef_compliance/chef-compliance-lab-test-instances.template)

### Notes
Follow the setup instructions in the readme.md files associated to each template.

## Details
1. Create a Red Hat Enterprise Linux 7 EC2 Instance a Private Subnet.
2. Create a Ubuntu 14 EC2 Instance a Private Subnet.
3. Create a Windows 2012 EC2 Instance a Private Subnet.

# TODO: Maybe I make this a generic template for setting up 3 instances and just point to it for the lab setup... Then can be used by other labs as desired.
