# VPC Templates

## Purpose
Create various Virtual Private Clouds.

## [VPC](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template)
Create a VPC with private and public networks.

### Requirements
1. Permissions to create all of the following with the CloudFormation Template.
2. The Subnet CIDR Blocks you enter can not be used within you VPC or Peered VPC. So Change the defaults to what works for your environment.
    1. There are online subnet calculators that help such as this one I use [Online Subnet Calculator](http://www.subnet-calculator.com/subnet.php?net_class=A).

### Details
1. Create new VPC.
2. Create 3 Public Subnets.
3. Create 3 Private Subnets.
4. Create a Public Route Table.
5. Create a Private Route Table.
6. Create an Internet Gateway and Attach it to the Public Route Table.
7. Create Public Network ACL.
8. Create Private Network ACL.
9. Create Instance Access Security Group.
    * Instance to Instance Access.
10. Create NAT Instance Access Security Group.
    * This is so a NAT Can come and go while the SG persists for the Instances.
