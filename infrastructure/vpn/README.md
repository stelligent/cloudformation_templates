# VPN Solution Templates

## Purpose
Create an AWS VPN Connection. The remote VPN Device is configured separately.

## [VPN Gateway](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpn/vpn.template)
Create a VPN Gateway in an existing VPC with private and public networks.

### Requirements
1. [VPC](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template)
    1. VPN Security Group to give EC2 instances access to use the VPN Gateway. This is included in the example VPC templates linked above.
    2. Public Subnet/s
    3. Private Subnet/s
    4. Public Route Table
    5. Private Route Table
