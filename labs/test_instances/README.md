# Lab Test Instances Lab CloudFormation Template

## Purpose
Setup three default AMI test instances to use for testing in lab. The three instances are Red Hat Enterprise Linux (RHEL), Ubuntu server and Windows Server 2012 R2.

## Supported Regions
* us-west-2
* us-east-1

## Setup Instructions

### Infrastructure
Either use an existing VPC Infrastructure or you can use the following templates to create a full lab in AWS.

1. [VPC](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.yml)
    1. Look at the VPC CloudFormation output for any needed values for the other template parameters.
2. [NAT Gateway](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/nat/nat-gateway.yml) (Optional)
3. [VPN BGP Site-to-Site Connection](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpn/vpn-bgp.yml) (Optional)
4. [Bastion Host](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/bastion/bastion.yml) (Optional)

## Test Instances
Select a test instance template:
1. [RHEL, Ubuntu and Windows 2012 R2](https://github.com/stelligent/cloudformation_templates/blob/master/labs/test_instances/rhel-ubuntu-win2012.yml)
    <br>**Details**
    1. Create a Red Hat Enterprise Linux 7 EC2 Instance a Private Subnet.
    2. Create a Ubuntu 14 EC2 Instance a Private Subnet.
    3. Create a Windows 2012 EC2 Instance a Private Subnet.

### Notes
Follow the setup instructions in the readme.md files associated to each template.
