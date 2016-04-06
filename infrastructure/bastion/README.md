# Bastion Host Template

## Purpose
Create a RHEL, Ubuntu and/or Windows Bastion Host EC2 Instance in a Public Subnet using Amazon provided AMIs.

## Supported Regions
* us-west-2
* us-east-1

## Requirements
1. Available EIP
2. [VPC](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template)

## Supported Bastion Operating Systems
* Red Hat Enterprise 7
* Ubuntu Server 14.04
* Windows Server 2012 R2

## Details
1. Create a single EC2 Instance on a Public subnet.
    * Selection of OS family is in the parameters.
2. Create EIP.
3. Association EIP with Bastion Host.