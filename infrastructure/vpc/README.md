# VPC Template

## Purpose
Create an AWS Virtual Private Cloud with public and private subnet configurations.

## Requirements
1. Permissions to create all of the following with the CloudFormation Template.
2. The Subnet CIDR Blocks you enter can not be used within your VPC or Peered VPC/s.
    1. Change the defaults to what works for your environment.
    2. There are online subnet calculators that help such as this one I use [Online Subnet Calculator](http://www.subnet-calculator.com/subnet.php?net_class=A).

## Creat Details
1. Single VPC.
2. 3 Public Subnets.
3. 3 Private Subnets.
4. Public Route Table.
5. Private Route Table.
6. Internet Gateway
    1. Attached to the Public Route Table.
7. Public Network ACL.
8. Private Network ACL.
9. VPC Endpoint
10. Instance Access Security Group.
    * Instance to Instance Access.
11. NAT Instance Access Security Group.
    * This is so a NAT Can come and go while the SG persists for the Instances.
12. Remote Access Security Group.
    * This can be used for to allow site-to-site VPN or Direct Connect Networks access to instances.

## Diagram
![alt text](https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/vpc.jpg "VPC CFN Template Diagram")
