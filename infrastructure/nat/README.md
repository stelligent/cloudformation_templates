# NAT Solution Templates

## Purpose
Create a NAT Gateway or NAT EC2 Instances to give private networks internet access.

## Prerequisites
1. VPC (Public Subnet, IGW, Private Subnet/s)
    * Either use an existing VPC Infrastructure or you can use the following [VPC Template](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template) to create a one.
        * Look at the VPC CloudFormation output for any needed values to enter in this template.
2. NAT Security Group
    * This is to allow instances access to NAT/Internet.
    * This is included in the [VPC Template](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template).

## [NAT Gateway Template](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/nat/nat-gateway.template)
Create a NAT Gateway in an existing VPC with private and public networks.

### Advantages
1. Redundancy built in.
2. Easier setup and management.

## [NAT Instance Template](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/nat/nat-instance.template) (WIP)
Create a single NAT EC2 Instance in an existing VPC with private and public networks.

### Advantages
1. The ability to stop the instance when it is not needed for a cost savings manually or through an automated process. Then easily turn it back on as needed without the need of configuration.
2. A small EC2 Instance type can be used which is less expensive than the NAT Gateway.
