# Stelligent CloudFormation Templates (WIP)

## Purpose
This repository contains a collaboration of general and specific Amazon Web Services CloudFormation Template Examples.

## Notable Templates

### Compliance

* [Chef Compliance](https://github.com/stelligent/cloudformation_templates/blob/master/compliance/chef_compliance)
  * Create a Chef Compliance Webapp EC2 Instance using Chef's published AMI in an existing VPC with a public network.

### Infrastructure

* [VPC](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template)
  * Used to create an entire VPC from scratch.
    * Creates a New VPC
    * Creates 3 Public Subnets
    * Creates 3 Private Subnets
    * Public Network ACLs
    * Private Network ACLs
    * Internet Gateway attached to Public Subnets
    * Instance to Instance Allow All Security Group
* [NAT Gateway](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/nat/natgateway.template)
  * Used to create a NAT Gateway on an existing VPC with Public and Private subnets.
    * Creates NAT Gateway on existing VPC with Public and Private subnets.
    * Creates Security Group to Allow Instances NAT Access to the Internet.
    * Updated Route Table for functionality of the NAT solution.
* [Bastion Host](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/bastion/bastion.template)
  * Used to create a Bastion host instance on an existing VPC.
    * Creates single Bastion instance on a Public subnet.
    * Select from RHEL, Ubuntu and Windows as the Bastion Host OS.

### Labs

* [Chef Compliance Lab](https://github.com/stelligent/cloudformation_templates/blob/master/labs/chef_compliance)
  * Using existing VPC, NAT, Bastion and Chef Compliance Webapp or creating new with various templates in this repo to setup a test lab for Chef Compliance.
    * Creates Red Hat Enterprise Linux 7 test server in private subnet
    * Creates Ubuntu 14 test server in private subnet
    * Creates Windows 2012 R2 test server in private subnet