# VPN Solution Templates

## Purpose
Create an AWS VPN Site-to-Site Connection. The remote VPN Device is configured separately.

## Prerequisites
1. VPC
    * Private Route Table and Network ACL required. Optional Public.
    * Either use an existing VPC Infrastructure or you can use the following [VPC Template](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template) to create a one.
        * Look at the VPC CloudFormation output for any needed values to enter in this template.
2. VPN Security Group
    * This is to allow instances access to NAT/Internet.
    * This is included in the [VPC Template](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template).
3. Remote Network (Office) VPN Device WAN IP
4. Remote Network CIDR Block to Allow Access and Propagate.
5. AWS Console privileges

## [VPN BGP Site-to-Site Connection Template](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpn/vpn-bgp.template)
Create a Site-to-Site VPN BGP Connection in an existing VPC with public and/or private networks.
* There is an option to not exclude allowing VPN access to the public networks. Simply select false for the 'Include Public Subnets', leave default value in Public Network ACL and Route Table. The values will just be ignored.
* This only sets up the AWS side of the VPN. After the CloudFormation creates the objects you'll then need to configure your remote VPN Device.
    * [Here's](https://www.bonusbits.com/wiki/HowTo:Setup_Site_to_Site_VPN_from_AWS_VPC_to_Sophos_UTM) an article that gives the configuration steps for configuring a Sophos UTM v9 VPN endpoint.
* This assumes that the Private Network ACL allows all outbound.
* The Private Network ACL inbound is updated to allow the remote network block specified.

## [VPN Static Site-to-Site Connection Template (No Fully Tested)](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpn/vpn-static.template)
Create a VPN Gateway that does not use BGP in an existing VPC with public and/or private networks.
