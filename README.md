# Stelligent CloudFormation Templates

## Purpose
This repository contains a collaboration of general and specific Amazon Web Services CloudFormation Template Examples.
The basic design is a layered approach so there is less repeat content between all the templates.
That way you can build a custom environment by picking the solution templates you wish to use.
In other words you won't see a VPC created over and over throughout the templates.
You simply use the VPC template then move to the next piece you would like to create.

Also, The general design leans towards not having to refactor the template to fit your account/environment.
By using the configured parameters from the console or CLI you should be able to use the template without the need to edit it.
The templates generally output all the information you may need for another template.
So, be sure to examine the **Outputs** tab after creating the stack.

## Notable Templates

### Infrastructure

* [VPC Template](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template)<br>
  Create an entire VPC from scratch.
    * Creates a New VPC
    * Creates 3 Public Subnets
    * Creates 3 Private Subnets
    * Public Network ACLs
    * Private Network ACLs
    * Internet Gateway attached to Public Subnets
    * Instance to Instance Allow All Security Group
* [NAT Gateway Template](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/nat/natgateway.template)<br>
  Create a NAT Gateway on an existing VPC with Public and Private subnets.
    * Creates NAT Gateway on existing VPC with Public and Private subnets.
    * Creates Security Group to Allow Instances NAT Access to the Internet.
    * Updated Route Table for functionality of the NAT solution.
* [Bastion Host Template](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/bastion/bastion.template)<br>
  Create a Bastion host instance on an existing VPC with Public and Private subnets.
    * Creates single Bastion instance on a Public subnet.
    * Select from RHEL, Ubuntu and Windows as the Bastion Host OS.
* [VPN BGP Site-to-Site Connection Template](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpn/vpn-bgp.template)<br>
  Create a Site-to-Site VPN BGP Connection in an existing VPC with public and/or private networks.
    * There is an option to not exclude allowing VPN access to the public networks. Simply select false for the 'Include Public Subnets', leave default value in Public Network ACL and Route Table. The values will just be ignored.
    * This only sets up the AWS side of the VPN. After the CloudFormation creates the objects you'll then need to configure your remote VPN Device.
      * [Here's](https://www.bonusbits.com/wiki/HowTo:Setup_Site_to_Site_VPN_from_AWS_VPC_to_Sophos_UTM) an article that gives the configuration steps for configuring a Sophos UTM v9 VPN endpoint.
    * This assumes that the Private Network ACL allows all outbound.
    * The Private Network ACL inbound is updated to allow the remote network block specified.

### Labs

* [Chef Compliance Lab](https://github.com/stelligent/cloudformation_templates/blob/master/labs/chef_compliance)<br>
  Creates a Chef Compliance Lab Webapp server on an existing VPC, Bastion/VPN with Public subnet that has an Internet Gateway.
    * Creates Chef Compliance Webapp server in public subnet.
    * Attaches EIP.
    * Added to Internal instance-to-instance Security Group for scan access.

##### Test Instances

* [RHEL, Ubuntu and Windows 2012 R2 Test Instances Template](https://github.com/stelligent/cloudformation_templates/blob/master/labs/test_instances/rhel-ubuntu-win2012.template)<br>
  Create 3 test instances in an existing VPC.
    * Create a Red Hat Enterprise Linux 7 EC2 Instance.
    * Create a Ubuntu 14 EC2 Instance.
    * Create a Windows 2012 EC2 Instance.