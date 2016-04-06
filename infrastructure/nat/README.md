# NAT Solution Templates

## Purpose
Create a NAT Gateway or NAT EC2 Instances to give private networks internet access.

## [NAT Gateway](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/nat/nat-gateway.template)
Create a NAT Gateway in an existing VPC with private and public networks.

### Requirements
1. [VPC](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template)
    1. NAT Gateway Security Group to give EC2 instances access to use the NAT Gateway. This is included in the example VPC templates linked above.
    2. Public Subnet
    3. Private Subnet/s
    4. Private Route Table

### Advantages
1. Redundancy built in.
2. Easier setup and management.

## [NAT Instance](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/nat/nat-instance.template) (WIP)
Create a single NAT EC2 Instance in an existing VPC with private and public networks.

### Requirements
1. [VPC](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template)
    1. NAT Gateway Security Group to give EC2 instances access to use the NAT Gateway. This is included in the example VPC templates linked above.
    2. Public Subnet
    3. Private Subnet/s
    4. Private Route Table

### Advantages
1. The ability to stop the instance when it is not needed for a cost savings manually or through an automated process. Then easily turn it back on as needed without the need of configuration.
2. A small EC2 Instance type can be used which is less expensive than the NAT Gateway.
