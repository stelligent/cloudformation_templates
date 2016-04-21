# VPN Solution Templates

## Purpose
Create an AWS VPN Site-to-Site Connection. The remote VPN Device is configured separately.

## [VPN BGP Site-to-Site Connection](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpn/vpn-bgp.template)
Create a VPN Gateway that uses BGP in an existing VPC with private and public networks.

## [VPN Static Site-to-Site Connection (No Fully Tested)](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpn/vpn-static.template)
Create a VPN Gateway that does not use BGP in an existing VPC with private and public networks.

### Requirements
1. [VPC](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template)
    1. VPN Security Group to give EC2 instances access to use the VPN Gateway. This is included in the example VPC templates linked above.
    2. Public Subnet/s
    3. Private Subnet/s
    4. Public Route Table
    5. Private Route Table
