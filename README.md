# Stelligent CloudFormation Templates (WIP)

## Purpose
This repository contains a collaboration of general and specific Amazon Web Services CloudFormation Template Examples.

## Notable Templates

### Infrastructure
* [vpc.template](https://github.com/stelligent/cloudformation_templates/infrastructure/vpc.template)
  * Used to create an entire VPC from scratch.
    * VPC
    * 3 Public Subnets
    * 3 Private Subnets
    * Public Network ACLs
    * Private Network ACLs
    * Internet Gateway attached to Public Subnets
    * Instance to Instance Allow All Security Group
* [vpc-natgateway.template](https://github.com/stelligent/cloudformation_templates/infrastructure/vpc-natgateway.template)
  * Used to create an entire VPC from scratch including a NAT Gateway.
    * VPC
    * 3 Public Subnets
    * 3 Private Subnets
    * Public Network ACLs
    * Private Network ACLs
    * Internet Gateway attached to Public Subnets
    * Instance to Instance Allow All Security Group
    * NAT Gateway configured on the first Public Subnet and available to all the Private Subnets
    * Instance to Internet Security Group to be used to allow specific instances usage access to the NAT Gateway.

### Labs
* [chef-compliance-lab.template](https://github.com/stelligent/cloudformation_templates/labs/chef-compliance-lab.template)
  * Used to create an entire Chef Compliance lab environment including it's own VPC from scratch.
    * VPC
    * 3 Public Subnets
    * 3 Private Subnets
    * Public Network ACLs
    * Private Network ACLs
    * Internet Gateway attached to Public Subnets
    * Instance to Instance Allow All Security Group
    * NAT Gateway configured on the first Public Subnet and available to all the Private Subnets
    * Instance to Internet Security Group to be used to allow specific instances usage access to the NAT Gateway.
    * Chef Compliance Autoscaling group of 1. (So can enable scheduled shutdowns at night)
    * Bastion Instance
    * ELB to Chef Compliance server
    * Red Hat Enterprise Linux 7 test server in private subnet
    * Ubuntu 14 test server in private subnet
    * Windows 2012 R2 test server in private subnet