# Stelligent CloudFormation Templates (WIP)

## Purpose
This repository contains a collaboration of general and specific Amazon Web Services CloudFormation Template Examples.

## Notable Templates

### Infrastructure
* [vpc.template](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc.template)
  * Used to create an entire VPC from scratch.
    * Creates a New VPC
    * Creates 3 Public Subnets
    * Creates 3 Private Subnets
    * Public Network ACLs
    * Private Network ACLs
    * Internet Gateway attached to Public Subnets
    * Instance to Instance Allow All Security Group
* [natgateway.template](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/natgateway.template)
  * Used to create a NAT Gateway on an existing VPC with Public and Private subnets.
    * Creates NAT Gateway on existing VPC with Public and Private subnets.
    * Creates Security Group to Allow Instances NAT Access to the Internet.
    * Updated Route Table for functionality of the NAT solution.
* [bastion.template](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/bastion.template)
  * Used to create a Bastion host instance on an existing VPC.
    * Creates single Bastion instance on a Public subnet.

### Labs
* [chef-compliance-lab.template](https://github.com/stelligent/cloudformation_templates/blob/master/labs/chef_compliance/chef-compliance-lab.template)
  * Used to create a Chef Compliance lab environment on an existing VPC with a Public subnet.
    * Creates Chef Compliance Instance using Chef created AMI
    * Creates Red Hat Enterprise Linux 7 test server in private subnet
    * Creates Ubuntu 14 test server in private subnet
    * Creates Windows 2012 R2 test server in private subnet