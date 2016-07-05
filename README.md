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

The AWS CLI examples can be dropped in a shell script and/or added to your CI/CD solution to spin up solutions in a fully automated fashion.
Of course logic around updating stacks, deleting and checking for success/failure should be addressed.

With a simple shell script and a customized parameter json file you can spin up stacks quickly and consistently.
 Furthermore it's just as easy to tear a CloudFormation stack versus if all the objects where created manually.

## Templates

### Categories
* [Orchestrators (WIP)](#orchestrators)
* [Infrastructure](#infrastructure)
* [Database](#database)
* [Autoscaling](#autoscaling)
* [Labs](#labs)


### Orchestrators
**!! WIP !!**<br>
One template to rule them all... These are master templates that call nested templates.
These are good to build out a full environment without having to run each template individually.
Coupled with a custom parameters JSON file can give you a one command solution to a complex setup and eliminate the need to duplicate code.

For instance you could have a VPC, NAT, RDS and Autoscaling Webapp behind an ELB and Update DNS all in one
command using various foundational templates that I've creates to be used together.

<table>
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/orchestrators/infrastructure.template">Infrastructure</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Select the foundational pieces for building out an infrastructure from the ground up.</p>
            <h6>Create Details</h6>
            <ol>
             <li>VPC</li>
             <li>Nat Gateway (Optional)</li>
             <li>Bastion Host (Optinoal)</li>
             <li>VPN (Optional)</li></li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/orchestrators/infrastructure.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/orchestrators/infrastructure.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-east-1</p>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">View in Designer</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/orchestrators/infrastructure.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/vpc-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public-media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
                        <p>COMING SOON</p>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <table>
                <tr>
                    <th align="left">AWS CLI Example</th>
                </tr>
                <tr>
                    <td>
                    <h6>Use Custom Parameters <a href="https://github.com/stelligent/cloudformation_templates/blob/master/orchestrators/parameters_examples/infrastructure-parameters.json">JSON</a> File</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                    <code>aws cloudformation create-stack --profile stelligent-dev --stack-name "stelligent-webapp-xyz" --template-url "https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/orchestrators/infrastructure.template" --parameters file:///Users/username/aws/cloudformation_parameters/stelligent-webapp-xyz.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                    <h6>Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                    <code>aws cloudformation create-stack --profile stelligent-dev --stack-name "stelligent-webapp-xyz" --template-url "https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/orchestrators/infrastructure.template" --parameters ... COMING SOON</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

### Infrastructure

<table>
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc.template">VPC (Virtual Private Cloud)</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Creates an entire VPC from scratch for Lab or Permanent.</p>
            <h6>Create Details</h6>
            <ol>
             <li>Single VPC</li>
             <li>3 Public Subnets</li>
             <li>3 Private Subnets</li>
             <li>Public Route Table</li>
             <li>Private Route Table</li>
             <li>Internet Gateway</li>
             <ul>
               <li>Attached to the Public Route Table</li>
             </ul>
             <li>Public Network ACL</li>
             <li>Private Network ACL</li>
             <li>VPC Endpoint</li>
             <li>Instance Access Security Group</li>
             <ul>
               <li>Instance to Instance Access</li>
             </ul>
             <li>Remote Access Security Group</li>
             <ul>
               <li>This can be used for to allow site-to-site VPN or Direct Connect Networks access to instances.</li>
             </ul>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpc.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpc.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-east-1</p>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">View in Designer</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpc.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/vpc-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://youtu.be/W20I3qj-Nyc" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <table>
                <tr>
                    <th align="left">AWS CLI Example</th>
                </tr>
                <tr>
                    <td>
                    <h6>Use Custom Parameters <a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/parameters_examples/vpc-parameters.json">JSON</a> File</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                    <code>aws cloudformation create-stack --profile stelligent-dev --stack-name "stelligent-dev-vpc" --template-url "https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpc.template" --parameters file:///Users/username/aws/cloudformation_parameters/stelligent-dev-vpc.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                    <h6>Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                    <code>aws cloudformation create-stack --profile stelligent-dev --stack-name "stelligent-dev-vpc" --template-url "https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpc.template" --parameters ParameterKey=Owner,ParameterValue="Levon Becker" ParameterKey=Project,ParameterValue="VPC Creation" ParameterKey=DeleteAfter,ParameterValue="Never" ParameterKey=VPCSubnetCidrBlock,ParameterValue="10.20.0.0/16" ParameterKey=AvailabilityZone1,ParameterValue="a" ParameterKey=AvailabilityZone2,ParameterValue="b" ParameterKey=AvailabilityZone3,ParameterValue="c" ParameterKey=PublicSubnetCidrBlock1,ParameterValue="10.20.1.0/24" ParameterKey=PublicSubnetCidrBlock2,ParameterValue="10.20.2.0/24" ParameterKey=PublicSubnetCidrBlock3,ParameterValue="10.20.3.0/24" ParameterKey=PrivateSubnetCidrBlock1,ParameterValue="10.20.4.0/24" ParameterKey=PrivateSubnetCidrBlock2,ParameterValue="10.20.5.0/24" ParameterKey=PrivateSubnetCidrBlock3,ParameterValue="10.20.6.0/24" ParameterKey=RemoteAccessNetwork,ParameterValue="50.12.34.56/32"</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/nat-gateway.template">NAT Gateway (Network Addresss Translation)</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Creates a NAT Gateway on an existing VPC with Public (IGW) and Private subnets. Private route table is updated to route traffic to the NAT gateway a Public subnet that has an Internet Gateway Attached.</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>VPC</li>
             <ul>
               <li>Public Subnet, IGW, Private Subnet/s.</li>
               <li>Either use an existing VPC Infrastructure or you can use the following <a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template" target="_blank">VPC Template</a> to create a one.</li>
             </ul>
            <li>AWS Privileges</li>
            </ol>
            <h6>Create Details</h6>
            <ol>
             <li>NAT Gateway</li>
             <li>EIP</li>
             <li>Add Route to Private Route Table</li>
            </ol>
            <h6>Advantages over NAT Instance</h6>
            <ol>
             <li>Redundancy built in.</li>
             <li>Easier setup and management.</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/nat-gateway.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/nat-gateway.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-east-1</p>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">View in Designer</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/nat-gateway.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/nat-gateway-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public-media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
                        <p>COMING SOON</p>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <table>
                <tr>
                    <th align="left">AWS CLI Example</th>
                </tr>
                <tr>
                    <td>
                    <h6>Use Custom Parameters <a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/parameters_examples/nat-gateway-parameters.json">JSON</a> File</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                    <code>aws cloudformation create-stack --profile stelligent-dev --stack-name "stelligent-dev-nat" --template-url "https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/nat-gateway.template" --parameters file:///Users/username/aws/cloudformation_parameters/stelligent-dev-nat.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                    <h6>Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                    <code>aws cloudformation create-stack --profile stelligent-dev --stack-name "stelligent-dev-nat" --template-url "https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/nat-gateway.template" --parameters ParameterKey=Owner,ParameterValue="Levon Becker" ParameterKey=Project,ParameterValue="NAT Gateway Creation" ParameterKey=DeleteAfter,ParameterValue="Never" ParameterKey=VPC,ParameterValue="vpc-b9f488dd" ParameterKey=PublicSubnet,ParameterValue="subnet-14197570" ParameterKey=PrivateRouteTable,ParameterValue="rtb-d5cce3b1" ParameterKey=PublicNetworkAcl,ParameterValue="acl-3d207459"</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpn-bgp.template">VPN BGP (Virtual Private Network using Border Gateway Protocol)</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Creates a Site-to-Site BGP VPN Connection in and existing VPC with public and/or private networks.
             There is an option to not exclude allowing VPN access to the public networks.
             Simply select false for the 'Include Public Subnets', leave default value in Public Network ACL and Route Table.
             The values will just be ignored. This only sets up the AWS side of the VPN.
             After the CloudFormation creates the objects you'll then need to configure your remote VPN Device.
             <a href="https://www.bonusbits.com/wiki/HowTo:Setup_Site_to_Site_VPN_from_AWS_VPC_to_Sophos_UTM" target="_blank">Here's</a> an article that gives the configuration steps for configuring a Sophos UTM v9 VPN endpoint.
             This assumes that the Private Network ACL allows all outbound. Lastly, the Private Network ACL inbound is updated to allow the remote network block specified.</p>
             <h6>Prerequisites</h6>
             <ol>
                <li>VPC</li>
                <ul>
                  <li>Public Subnet, IGW, Private Subnet/s.</li>
                  <li>Either use an existing VPC Infrastructure or you can use the following <a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc.template" target="_blank">VPC Template</a> to create a one.</li>
                </ul>
              <li>Remote Network (Office) VPN Device WAN IP</li>
              <li>Remote Network CIDR Block to Allow Access and Propagate.</li>
             </ol>
            <h6>Create Details</h6>
            <ol>
             <li>Customer Gateway</li>
             <li>Virtual Private Gateway</li>
             <li>VPN Connection</li>
             <li>Enable Route Propagation on Route Table/s</li>
             <li>Add Network ACL to Allow Remote Network</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpn-bgp.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpn-bgp.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-east-1</p>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">View in Designer</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpn-bgp.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/vpn-bgp-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public-media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
                        <p>COMING SOON</p>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <table>
                <tr>
                    <th align="left">AWS CLI Example</th>
                </tr>
                <tr>
                    <td>
                    <h6>Use Custom Parameters <a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/parameters_examples/vpn-bgp-parameters.json">JSON</a> File</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                    <code>aws cloudformation create-stack --profile stelligent-dev --stack-name "stelligent-dev-vpn" --template-url "https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpn-bgp.template" --parameters file:///Users/username/aws/cloudformation_parameters/stelligent-dev-vpn.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                    <h6>Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                    <code>aws cloudformation create-stack --profile stelligent-dev --stack-name "stelligent-dev-vpn" --template-url "https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpn-bgp.template" --parameters ParameterKey=Owner,ParameterValue="Levon Becker" ParameterKey=Project,ParameterValue="VPN Creation" ParameterKey=DeleteAfter,ParameterValue="Never" ParameterKey=VPC,ParameterValue="vpc-b9f488dd" ParameterKey=PublicRouteTable,ParameterValue="rtb-d6cce3b2" ParameterKey=PrivateRouteTable,ParameterValue="rtb-d5cce3b1" ParameterKey=PublicNetworkAcl,ParameterValue="acl-3d207459" ParameterKey=PrivateNetworkAcl,ParameterValue="acl-3c207458" ParameterKey=RemoteVpnDeviceIp,ParameterValue="50.23.45.67" ParameterKey=RemoteNetworkCidr,ParameterValue="192.168.100.0/24" ParameterKey=IncludePublicSubnets,ParameterValue="true"</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/bastion.template">Bastion</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Creates a single Bastion host on a Public subnet in an existing VPC. Select from either a RHEL, Ubuntu or Windows OS.</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>VPC</li>
             <ul>
               <li>Public Subnet, IGW, Private Subnet/s.</li>
               <li>Either use an existing VPC Infrastructure or you can use the following <a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template" target="_blank">VPC Template</a> to create a one.</li>
             </ul>
            <li>Available EIP</li>
            </ol>
            <h6>Create Details</h6>
            <ol>
             <li>EC2 Instance</li>
             <li>EIP</li>
             <li>IAM Role</li>
             <li>IAM Instance Profile</li>
             <li>Security Group</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/bastion.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png" width:144 alt="us-west-2"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/bastion.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-east-1</p>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">View in Designer</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/bastion.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/bastion-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public-media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
                        <p>COMING SOON</p>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <table>
                <tr>
                    <th align="left">AWS CLI Example</th>
                </tr>
                <tr>
                    <td>
                    <h6>Use Custom Parameters <a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/parameters_examples/bastion-parameters.json">JSON</a> File</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                    <code>aws cloudformation create-stack --profile stelligent-dev --stack-name "stelligent-dev-bastion" --template-url "https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/bastion.template" --parameters file:///Users/username/aws/cloudformation_parameters/stelligent-dev-rhel-bastion.json --capabilities CAPABILITY_IAM</code>
                    </td>
                </tr>
                <tr>
                    <td>
                    <h6>Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                    <code>aws cloudformation create-stack --profile stelligent-dev --stack-name "stelligent-dev-bastion" --template-url "https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/bastion.template" --capabilities CAPABILITY_IAM --parameters ParameterKey=Owner,ParameterValue="Levon Becker" ParameterKey=Project,ParameterValue="Bastion Creation" ParameterKey=DeleteAfter,ParameterValue="Never" ParameterKey=VPC,ParameterValue="vpc-b9f488dd" ParameterKey=PublicSubnet,ParameterValue="subnet-14197570" ParameterKey=PublicNetworkAcl,ParameterValue="acl-3d207459" ParameterKey=InternalAccessSecurityGroup,ParameterValue="sg-69d8410f" ParameterKey=OsType,ParameterValue="rhel" ParameterKey=NetworkAccessIP,ParameterValue="50.23.45.67/32" ParameterKey=InstanceType,ParameterValue="t2.small" ParameterKey=Ec2KeyPair,ParameterValue="stelligent-dev"</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

### Database

<table>
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/database/mysql-rds.template">MySQL RDS</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Creates a MySQL RDS Database Instance.</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>VPC</li>
             <ul>
               <li>Public Subnet, IGW, Private Subnet/s.</li>
               <li>Either use an existing VPC Infrastructure or you can use the following <a href="https://github.com/stelligent/cloudformation_templates/blob/master/database/mysql-rds.template" target="_blank">VPC Template</a> to create a one.</li>
             </ul>
            </ol>
            <h6>Create Details</h6>
            <ol>
             <li>DB Instance</li>
             <li>DB Subnet Group</li>
             <li>Security Group</li>
             <li>Cloud Watch Alarms</li>
             <li>Route 53 Record Set (Optional)</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/database/mysql-rds.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/database/mysql-rds.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-east-1</p>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">View in Designer</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/database/mysql-rds.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/mysql-rds-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public-media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
                        <p>COMING SOON</p>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <table>
                <tr>
                    <th align="left">AWS CLI Example</th>
                </tr>
                <tr>
                    <td>
                    <h6>Use Custom Parameters <a href="https://github.com/stelligent/cloudformation_templates/blob/master/database/parameters_examples/mysql-rds-parameters.json">JSON</a> File</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                    <code>aws cloudformation create-stack --profile stelligent-dev --stack-name "stelligent-dev-mysql-rds" --template-url "https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/database/mysql-rds.template" --parameters file:///Users/username/aws/cloudformation_parameters/stelligent-dev-mysql-rds.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                    <h6>Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                    <code>aws cloudformation create-stack --profile stelligent-dev --stack-name "stelligent-dev-mysql-rds" --template-url "https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/database/mysql-rds.template" --parameters ParameterKey=Owner,ParameterValue="Levon Becker" ParameterKey=Project,ParameterValue="MySQL RDS Creation" ParameterKey=DeleteAfter,ParameterValue="08/01/2016" ParameterKey=VPC,ParameterValue="vpc-b9f488dd" ParameterKey=PrivateSubnet1,ParameterValue="subnet-14197570" ParameterKey=PrivateSubnet2,ParameterValue="subnet-14197571" ParameterKey=PrivateSubnet3,ParameterValue="subnet-14197572" ParameterKey=PublicNetworkAcl,ParameterValue="acl-3d207459" ParameterKey=MasterUsername,ParameterValue="superman" ParameterKey=MasterUserPassword,ParameterValue="Kryptonite" ParameterKey=BackupRetentionPeriod,ParameterValue="30" ParameterKey=MultiAvailabilityZone,ParameterValue="true" ParameterKey=ConfigureDns,ParameterValue="true" ParameterKey=Cname,ParameterValue="justice.league.com" ParameterKey=R53HostedZoneName,ParameterValue="league.com" ParameterKey=AlertSnsTopicArn,ParameterValue="arn:aws:sns:us-west-2:000000000000:rds-alerts" ParameterKey=AllocatedStorage,ParameterValue="30" ParameterKey=InstanceType,ParameterValue="db.t2.medium"</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

### Autoscaling

<table>
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/webapp/autoscaling-bakedami-rdsbackend.template">Baked AMI, RDS Backend</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Create an Autoscaling group in 3 private subnets from a baked AMI, an Elastic Load Balancer in 3 public subnets and S3 ELB Logging Bucket.
            Option to use SSL/TLS on ELB. Option to update Route 53 Hosted DNS alias to point to the ELB.
            Setup to add RDS Access Security Group. Does not create an RDS Instance. Use an RDS Instance Cloudformation Template first.</p>
            <h6>Create Details</h6>
            <ol>
             <li>EC2 Instances</li>
             <li>AutoScaling</li>
             <li>Launch Configuration</li>
             <li>Elastic Load Balancer</li>
             <li>IAM Role</li>
             <li>IAM Instance Profile</li>
             <li>Security Group</li>
             <li>Scale Up Policy</li>
             <li>Scale Down Policy</li>
             <li>Cloud Watch Alarm</li>
             <li>Network ACL Entry</li>
             <li>Route 53 Record Set (Optional)</li>
             <li>S3 Bucket (Optional)</li>
             <li>S3 Bucket Policy (Optional)</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/webapp/autoscaling-bakedami-rdsbackend.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/webapp/autoscaling-bakedami-rdsbackend.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-east-1</p>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">View in Designer</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/webapp/autoscaling-bakedami-rdsbackend.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/autoscaling-bakedami-rdsbackend-200x181.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public-media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
                        <p>COMING SOON</p>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <table>
                <tr>
                    <th align="left">AWS CLI Example</th>
                </tr>
                <tr>
                    <td>
                    <h6>Use Custom Parameters <a href="https://github.com/stelligent/cloudformation_templates/blob/master/webapp/parameters_examples/autoscaling-bakedami-rdsbackend-parameters.json">JSON</a> File</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                    <code>aws cloudformation create-stack --profile stelligent-dev --stack-name "stelligent-dev-rdsbacked-webapp" --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/webapp/autoscaling-bakedami-rdsbackend.template" --parameters file:///Users/username/aws/cloudformation_parameters/stelligent-dev-rdsbacked-webapp.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                    <h6>Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                    <code>aws cloudformation create-stack --profile stelligent-dev --stack-name "stelligent-dev-rdsbacked-webapp" --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/webapp/autoscaling-bakedami-rdsbackend.template" --parameters ParameterKey=Owner,ParameterValue="Levon Becker" ParameterKey=Project,ParameterValue="Autoscaling Baked AMI Webapp Stack Creation" ParameterKey=DeleteAfter,ParameterValue="08/01/2016" ParameterKey=VPC,ParameterValue="vpc-b9f488dd" ParameterKey=PublicSubnet1,ParameterValue="subnet-24197570" ParameterKey=PublicSubnet2,ParameterValue="subnet-24197571" ParameterKey=PublicSubnet3,ParameterValue="subnet-24197572" ParameterKey=PrivateSubnet1,ParameterValue="subnet-14197570" ParameterKey=PrivateSubnet2,ParameterValue="subnet-14197571" ParameterKey=PrivateSubnet3,ParameterValue="subnet-14197572" ParameterKey=PublicNetworkAcl,ParameterValue="acl-3d207459" ParameterKey=InstanceType,ParameterValue="t2.small" ParameterKey=AMI,ParameterValue="ami-00000000" ParameterKey=Ec2KeyPair,ParameterValue="stelligent-dev" ParameterKey=MinAutoScaleCount,ParameterValue="3" ParameterKey=MaxAutoScaleCount,ParameterValue="6" ParameterKey=InternalAccessSecurityGroup,ParameterValue="sg-69d8410f" ParameterKey=RemoteSecurityGroup,ParameterValue="sg-50d8410d" ParameterKey=RDSAccessSecurityGroup,ParameterValue="sg-40d8410e" ParameterKey=ConfigureDns,ParameterValue="true" ParameterKey=Route53ElbAlias,ParameterValue="www.hecklejeckle.com" ParameterKey=UseSsl,ParameterValue="true" ParameterKey=ElbSslCertArn,ParameterValue="arn:aws:iam::0000000000000:server-certificate/www.hecklejeckle.com" ParameterKey=ElbHttpListeningPort,ParameterValue="443" ParameterKey=InstanceHttpListeningPort,ParameterValue="8443" ParameterKey=ListenOnBothPorts,ParameterValue="false" ParameterKey=SetupElbLogging,ParameterValue="true"</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/webapp/autoscaling-bakedami.template">Baked AMI</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Create an Autoscaling group in 3 private subnets from a baked AMI, an Elastic Load Balancer in 3 public subnets and S3 ELB Logging Bucket.
            Option to use SSL/TLS on ELB. Option to update Route 53 Hosted DNS alias to point to the ELB.</p>
            <h6>Create Details</h6>
            <ol>
             <li>EC2 Instances</li>
             <li>AutoScaling</li>
             <li>Launch Configuration</li>
             <li>Elastic Load Balancer</li>
             <li>IAM Role</li>
             <li>IAM Instance Profile</li>
             <li>Security Group</li>
             <li>Scale Up Policy</li>
             <li>Scale Down Policy</li>
             <li>Cloud Watch Alarm</li>
             <li>Network ACL Entry</li>
             <li>Route 53 Record Set (Optional)</li>
             <li>S3 Bucket (Optional)</li>
             <li>S3 Bucket Policy (Optional)</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/webapp/autoscaling-bakedami.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/webapp/autoscaling-bakedami.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-east-1</p>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">View in Designer</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/webapp/autoscaling-bakedami.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/autoscaling-bakedami-200x181.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public-media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
                        <p>COMING SOON</p>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <table>
                <tr>
                    <th align="left">AWS CLI Example</th>
                </tr>
                <tr>
                    <td>
                    <h6>Use Custom Parameters <a href="https://github.com/stelligent/cloudformation_templates/blob/master/webapp/parameters_examples/autoscaling-bakedami-parameters.json">JSON</a> File</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                    <code>aws cloudformation create-stack --profile stelligent-dev --stack-name "stelligent-dev-webapp" --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/webapp/autoscaling-bakedami.template" --parameters file:///Users/username/aws/cloudformation_parameters/stelligent-dev-webapp.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                    <h6>Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                    <code>aws cloudformation create-stack --profile stelligent-dev --stack-name "stelligent-dev-webapp" --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/webapp/autoscaling-bakedami.template" --parameters ParameterKey=Owner,ParameterValue="Levon Becker" ParameterKey=Project,ParameterValue="Autoscaling Baked AMI Webapp Stack Creation" ParameterKey=DeleteAfter,ParameterValue="08/01/2016" ParameterKey=VPC,ParameterValue="vpc-b9f488dd" ParameterKey=PublicSubnet1,ParameterValue="subnet-24197570" ParameterKey=PublicSubnet2,ParameterValue="subnet-24197571" ParameterKey=PublicSubnet3,ParameterValue="subnet-24197572" ParameterKey=PrivateSubnet1,ParameterValue="subnet-14197570" ParameterKey=PrivateSubnet2,ParameterValue="subnet-14197571" ParameterKey=PrivateSubnet3,ParameterValue="subnet-14197572" ParameterKey=PublicNetworkAcl,ParameterValue="acl-3d207459" ParameterKey=InstanceType,ParameterValue="t2.small" ParameterKey=AMI,ParameterValue="ami-00000000" ParameterKey=Ec2KeyPair,ParameterValue="stelligent-dev" ParameterKey=MinAutoScaleCount,ParameterValue="3" ParameterKey=MaxAutoScaleCount,ParameterValue="6" ParameterKey=InternalAccessSecurityGroup,ParameterValue="sg-69d8410f" ParameterKey=RemoteSecurityGroup,ParameterValue="sg-50d8410d" ParameterKey=ConfigureDns,ParameterValue="true" ParameterKey=Route53ElbAlias,ParameterValue="www.hecklejeckle.com" ParameterKey=UseSsl,ParameterValue="true" ParameterKey=ElbSslCertArn,ParameterValue="arn:aws:iam::0000000000000:server-certificate/www.hecklejeckle.com" ParameterKey=ElbHttpListeningPort,ParameterValue="443" ParameterKey=InstanceHttpListeningPort,ParameterValue="8443" ParameterKey=ListenOnBothPorts,ParameterValue="false" ParameterKey=SetupElbLogging,ParameterValue="true"</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

### Labs

<table>
  <tbody>
    <tr>
      <th align="left">Template</th>
      <th align="left">Description</th>
      <th align="left">View in Designer & HowTo Videos</th>
      <th align="left">Launch</th>
    </tr>
    <tr>
      <td><a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/chef_compliance">Chef Compliance Lab</a></td>
      <td>
        <p>Creates a Chef Complianc Web server in a Public Subnet with Internet Gatewayy attached on an existing VPC.
         It then attaches an EIP and finally adds the instance to an existing instance-to-instance security group.</p>
        <h6>Prerequisites</h6>
        <ol>
         <li>VPC</li>
         <ul>
           <li>Public Subnet, IGW, Private Subnet/s.</li>
           <li>Either use an existing VPC Infrastructure or you can use the following <a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc.template" target="_blank">VPC Template</a> to create a one.</li>
         </ul>
        <li>Available EIP</li>
        </ol>
        <h6>Supported Regions</h6>
         <ol>
           <li>us-west-2</li>
           <li>us-east-1</li>
         </ol>
        <h6>Create Details</h6>
        <ol>
         <li>EC2 Instance</li>
         <li>EIP</li>
         <li>IAM Role</li>
         <li>IAM Instance Profile</li>
         <li>Security Group</li>
        </ol>
      </td>
      <td nowrap width="144">
        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/labs/chef_compliance/chef-compliance.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/chef-compliance-lab-200x200.jpg" width:100% alt="View in Designer"></a>
      </td>
      <td nowrap width="144">
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/labs/chef_compliance/chef-compliance.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-west-2</p>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/labs/chef_compliance/chef-compliance.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-east-1</p>
      </td>
    </tr>
    <tr>
      <td><a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/test_instances/rhel-ubuntu-win2012.template">Test Instances</a></td>
      <td>
        <p>Creates three test instances in an existing VPC. Each instance is a different operating system. They are; Red Hat Enterprise Linux 7, Ubuntu 14 and Windows 2012 R2.</p>
        <h6>Create Details</h6>
        <ol>
         <li>3 EC2 Instances</li>
         <li>IAM Role</li>
         <li>IAM Instance Profile</li>
        </ol>
      </td>
      <td nowrap>
        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/labs/test_instances/rhel-ubuntu-win2012.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/test-instances-200x200.jpg" width:100% alt="View in Designer"></a>
      </td>
      <td nowrap>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/labs/test_instances/rhel-ubuntu-win2012.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-west-2</p>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/labs/test_instances/rhel-ubuntu-win2012.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-east-1</p>
      </td>
    </tr>
  </tbody>
</table>