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

The AWS CLI examples can be dropped in a shell script and/or added to your CI/CD solution to spin up solutions in a fully automated fashion. Of course, logic around updating stacks, deleting and checking for success/failure should be addressed.

With a simple shell script and a customized parameter json file you can spin up stacks quickly and consistently. Furthermore, it's just as easy to tear a CloudFormation stack versus if all the objects were created manually.

## Templates

### Categories
* [Orchestrators](#orchestrators)
* [Infrastructure](#infrastructure)
* [Storage](#storage)
* [Database](#database)
* [Autoscaling](#autoscaling)
* [Labs](#labs)


### Orchestrators
[Back to Top](#purpose)

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
             <li>Bastion Host (Optional)</li>
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
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/orchestrators/infrastructure.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/orchestrators/infrastructure.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/orchestrators/infrastructure.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/infra-orchestrator-600x600.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/orchestrators/infrastructure.template"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/orchestrators/parameters_examples/infrastructure-parameters.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/custom-parameters.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code>--parameters COMING SOON</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

### Infrastructure
[Back to Top](#purpose)

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
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/infrastructure/vpc.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/infrastructure/vpc.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/infrastructure/vpc.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/vpc-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://youtu.be/0bf2w0zSsWM" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/infrastructure/vpc.template"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/parameters_examples/vpc-parameters.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/custom-parameters.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code>--parameters ParameterKey=Owner,ParameterValue="Levon Becker" ParameterKey=Project,ParameterValue="VPC Creation" ParameterKey=DeleteAfter,ParameterValue="Never" ParameterKey=VPCSubnetCidrBlock,ParameterValue="10.20.0.0/16" ParameterKey=AvailabilityZone1,ParameterValue="a" ParameterKey=AvailabilityZone2,ParameterValue="b" ParameterKey=AvailabilityZone3,ParameterValue="c" ParameterKey=PublicSubnetCidrBlock1,ParameterValue="10.20.1.0/24" ParameterKey=PublicSubnetCidrBlock2,ParameterValue="10.20.2.0/24" ParameterKey=PublicSubnetCidrBlock3,ParameterValue="10.20.3.0/24" ParameterKey=PrivateSubnetCidrBlock1,ParameterValue="10.20.4.0/24" ParameterKey=PrivateSubnetCidrBlock2,ParameterValue="10.20.5.0/24" ParameterKey=PrivateSubnetCidrBlock3,ParameterValue="10.20.6.0/24" ParameterKey=RemoteAccessNetwork,ParameterValue="50.12.34.56/32"</code>
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
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/infrastructure/nat-gateway.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/infrastructure/nat-gateway.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/infrastructure/nat-gateway.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/nat-gateway-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://youtu.be/YElJ_mI2-Ng" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/infrastructure/nat-gateway.template"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/parameters_examples/nat-gateway-parameters.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/custom-parameters.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code>--parameters ParameterKey=Owner,ParameterValue="Levon Becker" ParameterKey=Project,ParameterValue="NAT Gateway Creation" ParameterKey=DeleteAfter,ParameterValue="Never" ParameterKey=VPC,ParameterValue="vpc-b9f488dd" ParameterKey=PublicSubnet,ParameterValue="subnet-14197570" ParameterKey=PrivateRouteTable,ParameterValue="rtb-d5cce3b1" ParameterKey=PublicNetworkAcl,ParameterValue="acl-3d207459"</code>
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
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/infrastructure/vpn-bgp.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/infrastructure/vpn-bgp.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/infrastructure/vpn-bgp.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/vpn-bgp-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://youtu.be/DCprX10Xaco" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/infrastructure/vpn-bgp.template"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/parameters_examples/vpn-bgp-parameters.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/custom-parameters.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code>--parameters ParameterKey=Owner,ParameterValue="Levon Becker" ParameterKey=Project,ParameterValue="VPN Creation" ParameterKey=DeleteAfter,ParameterValue="Never" ParameterKey=VPC,ParameterValue="vpc-b9f488dd" ParameterKey=PublicRouteTable,ParameterValue="rtb-d6cce3b2" ParameterKey=PrivateRouteTable,ParameterValue="rtb-d5cce3b1" ParameterKey=PublicNetworkAcl,ParameterValue="acl-3d207459" ParameterKey=PrivateNetworkAcl,ParameterValue="acl-3c207458" ParameterKey=RemoteVpnDeviceIp,ParameterValue="50.23.45.67" ParameterKey=RemoteNetworkCidr,ParameterValue="192.168.100.0/24" ParameterKey=IncludePublicSubnets,ParameterValue="true"</code>
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
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/infrastructure/bastion.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png" width:144 alt="us-west-2"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/infrastructure/bastion.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/infrastructure/bastion.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/bastion-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/infrastructure/bastion.template"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/parameters_examples/bastion-parameters.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/custom-parameters.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code>--parameters ParameterKey=Owner,ParameterValue="Levon Becker" ParameterKey=Project,ParameterValue="Bastion Creation" ParameterKey=DeleteAfter,ParameterValue="Never" ParameterKey=VPC,ParameterValue="vpc-b9f488dd" ParameterKey=PublicSubnet,ParameterValue="subnet-14197570" ParameterKey=PublicNetworkAcl,ParameterValue="acl-3d207459" ParameterKey=InternalAccessSecurityGroup,ParameterValue="sg-69d8410f" ParameterKey=OsType,ParameterValue="rhel" ParameterKey=NetworkAccessIP,ParameterValue="50.23.45.67/32" ParameterKey=InstanceType,ParameterValue="t2.small" ParameterKey=Ec2KeyPair,ParameterValue="stelligent-dev"</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

### Storage
[Back to Top](#purpose)

<table width="100%">
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/storage/efs.yml">EFS</a></h4></th>
    </tr>
    <tr>
        <td width="100%" valign="top">
            <p>Creates an Elastic File System with 3 Mounts</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>VPC</li>
             <ul>
               <li>3 Subnets</li>
             </ul>
            </ol>
            <h6>Create Details</h6>
            <ol>
             <li>EFS Filesystem</li>
             <li>3 Mount Targets</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/storage/efs.yml" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/storage/efs.yml" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-east-1</p>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

### Database
[Back to Top](#purpose)

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
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/database/mysql-rds.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/database/mysql-rds.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/database/mysql-rds.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/mysql-rds-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/database/mysql-rds.template"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/database/parameters_examples/mysql-rds-parameters.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/custom-parameters.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code>--parameters ParameterKey=Owner,ParameterValue="Levon Becker" ParameterKey=Project,ParameterValue="MySQL RDS Creation" ParameterKey=DeleteAfter,ParameterValue="08/01/2016" ParameterKey=VPC,ParameterValue="vpc-b9f488dd" ParameterKey=PrivateSubnet1,ParameterValue="subnet-14197570" ParameterKey=PrivateSubnet2,ParameterValue="subnet-14197571" ParameterKey=PrivateSubnet3,ParameterValue="subnet-14197572" ParameterKey=PublicNetworkAcl,ParameterValue="acl-3d207459" ParameterKey=MasterUsername,ParameterValue="superman" ParameterKey=MasterUserPassword,ParameterValue="Kryptonite" ParameterKey=BackupRetentionPeriod,ParameterValue="30" ParameterKey=MultiAvailabilityZone,ParameterValue="true" ParameterKey=ConfigureDns,ParameterValue="true" ParameterKey=Cname,ParameterValue="justice.league.com" ParameterKey=R53HostedZoneName,ParameterValue="league.com" ParameterKey=AlertSnsTopicArn,ParameterValue="arn:aws:sns:us-west-2:000000000000:rds-alerts" ParameterKey=AllocatedStorage,ParameterValue="30" ParameterKey=InstanceType,ParameterValue="db.t2.medium"</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

### Autoscaling
[Back to Top](#purpose)

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
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/webapp/autoscaling-bakedami-rdsbackend.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/webapp/autoscaling-bakedami-rdsbackend.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/webapp/autoscaling-bakedami-rdsbackend.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/autoscaling-bakedami-rdsbackend-200x181.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/webapp/autoscaling-bakedami-rdsbackend.template"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/webapp/parameters_examples/autoscaling-bakedami-rdsbackend-parameters.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/custom-parameters.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code>--parameters ParameterKey=Owner,ParameterValue="Levon Becker" ParameterKey=Project,ParameterValue="Autoscaling Baked AMI Webapp Stack Creation" ParameterKey=DeleteAfter,ParameterValue="08/01/2016" ParameterKey=VPC,ParameterValue="vpc-b9f488dd" ParameterKey=PublicSubnet1,ParameterValue="subnet-24197570" ParameterKey=PublicSubnet2,ParameterValue="subnet-24197571" ParameterKey=PublicSubnet3,ParameterValue="subnet-24197572" ParameterKey=PrivateSubnet1,ParameterValue="subnet-14197570" ParameterKey=PrivateSubnet2,ParameterValue="subnet-14197571" ParameterKey=PrivateSubnet3,ParameterValue="subnet-14197572" ParameterKey=PublicNetworkAcl,ParameterValue="acl-3d207459" ParameterKey=InstanceType,ParameterValue="t2.small" ParameterKey=AMI,ParameterValue="ami-00000000" ParameterKey=Ec2KeyPair,ParameterValue="stelligent-dev" ParameterKey=MinAutoScaleCount,ParameterValue="3" ParameterKey=MaxAutoScaleCount,ParameterValue="6" ParameterKey=InternalAccessSecurityGroup,ParameterValue="sg-69d8410f" ParameterKey=RemoteSecurityGroup,ParameterValue="sg-50d8410d" ParameterKey=RDSAccessSecurityGroup,ParameterValue="sg-40d8410e" ParameterKey=ConfigureDns,ParameterValue="true" ParameterKey=Route53ElbAlias,ParameterValue="www.hecklejeckle.com" ParameterKey=UseSsl,ParameterValue="true" ParameterKey=ElbSslCertArn,ParameterValue="arn:aws:iam::0000000000000:server-certificate/www.hecklejeckle.com" ParameterKey=ElbHttpListeningPort,ParameterValue="443" ParameterKey=InstanceHttpListeningPort,ParameterValue="8443" ParameterKey=ListenOnBothPorts,ParameterValue="false" ParameterKey=SetupElbLogging,ParameterValue="true"</code>
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
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/webapp/autoscaling-bakedami.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/webapp/autoscaling-bakedami.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/webapp/autoscaling-bakedami.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/autoscaling-bakedami-200x181.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/webapp/autoscaling-bakedami.template"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/webapp/parameters_examples/autoscaling-bakedami-parameters.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/custom-parameters.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code>--parameters ParameterKey=Owner,ParameterValue="Levon Becker" ParameterKey=Project,ParameterValue="Autoscaling Baked AMI Webapp Stack Creation" ParameterKey=DeleteAfter,ParameterValue="08/01/2016" ParameterKey=VPC,ParameterValue="vpc-b9f488dd" ParameterKey=PublicSubnet1,ParameterValue="subnet-24197570" ParameterKey=PublicSubnet2,ParameterValue="subnet-24197571" ParameterKey=PublicSubnet3,ParameterValue="subnet-24197572" ParameterKey=PrivateSubnet1,ParameterValue="subnet-14197570" ParameterKey=PrivateSubnet2,ParameterValue="subnet-14197571" ParameterKey=PrivateSubnet3,ParameterValue="subnet-14197572" ParameterKey=PublicNetworkAcl,ParameterValue="acl-3d207459" ParameterKey=InstanceType,ParameterValue="t2.small" ParameterKey=AMI,ParameterValue="ami-00000000" ParameterKey=Ec2KeyPair,ParameterValue="stelligent-dev" ParameterKey=MinAutoScaleCount,ParameterValue="3" ParameterKey=MaxAutoScaleCount,ParameterValue="6" ParameterKey=InternalAccessSecurityGroup,ParameterValue="sg-69d8410f" ParameterKey=RemoteSecurityGroup,ParameterValue="sg-50d8410d" ParameterKey=ConfigureDns,ParameterValue="true" ParameterKey=Route53ElbAlias,ParameterValue="www.hecklejeckle.com" ParameterKey=UseSsl,ParameterValue="true" ParameterKey=ElbSslCertArn,ParameterValue="arn:aws:iam::0000000000000:server-certificate/www.hecklejeckle.com" ParameterKey=ElbHttpListeningPort,ParameterValue="443" ParameterKey=InstanceHttpListeningPort,ParameterValue="8443" ParameterKey=ListenOnBothPorts,ParameterValue="false" ParameterKey=SetupElbLogging,ParameterValue="true"</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

### Labs
[Back to Top](#purpose)

<table>
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/chef_compliance">Chef Compliance Lab</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Creates a Chef Compliance Web server in a Public Subnet with Internet Gateway attached on an existing VPC.
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
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/chef_compliance/chef-compliance.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/chef_compliance/chef-compliance.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/chef_compliance/chef-compliance.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/chef-compliance-lab-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/chef_compliance/chef-compliance.template"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/chef_compliance/example-parameters.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/custom-parameters.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code>--parameters ... COMING SOON</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/bitbucket/bitbucket.template">Bitbucket Lab</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Creates a Bitbucket Server in a private or public subnet in an existing VPC.</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>VPC</li>
              <ul>
                <li>Public or Private Subnet</li>
                <li>Internal Instance Access Security Group</li>
                <li>Either use an existing VPC Infrastructure or you can use the following <a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc.template" target="_blank">VPC Template</a> to create a one.</li>
              </ul>
              <li>Internet Access from the EC2 Instance or Yum access solution</li>
              <li>EC2 Key Pair</li>
              <li>Available EIP if Selected Public Facing</li>
              <li>IAM Role Creation Permissions</li>
            </ol>
            <h6>Supported Regions</h6>
             <ol>
               <li>cn-north-1</li>
               <li>us-east-1</li>
               <li>us-west-1</li>
               <li>us-west-2</li>
               <li>eu-west-1</li>
               <li>eu-central-1</li>
               <li>ap-northeast-1</li>
               <li>ap-northeast-2</li>
               <li>ap-southeast-1</li>
               <li>ap-southeast-2</li>
               <li>sa-east-1</li>
             </ol>
            <h6>Create Details</h6>
            <ol>
             <li>EC2 Instance (Amazon Linux)</li>
             <li>EIP (Optional)</li>
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
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/bitbucket/bitbucket.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/bitbucket/bitbucket.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/bitbucket/bitbucket.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/bitbucket-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/bitbucket/bitbucket.template"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/bitbucket/bitbucket-parameters.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/custom-parameters.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code>--parameters ... COMING SOON</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/tree/master/labs/eb">Elastic Beanstalk CodePipeline Lab</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Automates the integration between AWS Elastic Beanstalk and CodePipeline</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>CodeCommit Repo</li>
            </ol>
            <h6>Supported Regions</h6>
             <ol>
               <li>us-east-1</li>
             </ol>
            <h6>Create Details</h6>
            <ol>
             <li>IAM InstanceProfile, Policy, and Roles</li>
             <li>Elastic Beanstalk - ConfigurationTemplate, Environment</li>
             <li>CodePipeline with CodeCommit Integration</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/eb/elasticbeanstalk-codepipeline.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-east-1&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/eb/elasticbeanstalk-codepipeline.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/elasticbeanstalk-codepipeline-labs.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/eb/elasticbeanstalk-codepipeline.json"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/eb/example-parameters.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/custom-parameters.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code> --parameters ParameterKey=RepositoryName,ParameterValue=codecommit-demo"</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
       <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/tree/master/labs/codecommit">CodeCommit CodePipeline Lab</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Automates the integration between AWS CodeCommit and CodePipeline</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>EC2 Key Pair</li>
             <li>CodeCommit Repo</li>
            </ol>
            <h6>Supported Regions</h6>
             <ol>
               <li>us-east-1</li>
             </ol>
            <h6>Create Details</h6>
            <ol>
             <li>IAM InstanceProfile, Policy, and Roles</li>
             <li>EC2 Instance for CodeDeploy</li>
             <li>CodeDeploy</li>
             <li>CodePipeline with CodeCommit Integration</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/codecommit/codepipeline-codecommit.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-east-1&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/codecommit/codepipeline-codecommit.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/codecommit-codepipeline-lab.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/codecommit/codepipeline-codecommit.json"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/codecommit/example-parameters.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/custom-parameters.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code> --parameters ParameterKey=EC2KeyPairName,ParameterValue=stelligent-dev"</code>
                    </td>
                </tr>
            </table>
        </td>
    
   <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/codepipeline/codepipeline-canonical.yml">Mock Stages and Actions in AWS CodePipeline and AWS Lambda</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Creates a deployment pipeline in AWS CodePipeline using a pre-built Lambda function. It can be used to model a pipeline without initial implementation</p>
            <h6>Prerequisites</h6>
              <ol>
                <li>AWS Account</li>
              </ol>
            <h6>Supported Regions</h6>
             <ol>
               <li>us-east-1</li>
             </ol>
            <h6>Create Details</h6>
            <ol>
             <li>Amazon S3 bucket for CodePipeline artifacts</li>
             <li>AWS SNS Topic</li>
             <li>AWS IAM Policy and Roles</li>
             <li>AWS Lambda Function</li>
             <li>AWS CodePipeline Stages and Actions</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/codepipeline/codepipeline-canonical.yml" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-east-1&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/codepipeline/codepipeline-canonical.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/codepipeline_mock_designer.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/codepipeline/codepipeline-canonical.yml"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/codepipeline/example-parameters-lambda.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/example-parameters-lambda.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code> --parameters ParameterKey=EmailAddress,ParameterValue=youremailaddress@example.com"</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>


    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/tree/master/labs/lambda">AWS Lambda CodePipeline Lab</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Automates the integration between AWS Lambda and CodePipeline</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>N/A</li>
            </ol>
            <h6>Supported Regions</h6>
             <ol>
               <li>us-east-1</li>
             </ol>
            <h6>Create Details</h6>
            <ol>
             <li>IAM Policy and Roles</li>
             <li>Lambda Function</li>
             <li>CodePipeline</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/lambda/lambda-codepipeline.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-east-1&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/lambda/lambda-codepipeline.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/lambda-codepipeline.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/lambda/lambda-codepipeline.json"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/lambda/example-parameters.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/custom-parameters.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code> --parameters ParameterKey=KeyName,ParameterValue=stelligent-dev"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Outputs</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code>CodePipelineURL - URL for generated pipeline in CodePipeline console.</code>
                   </td>
                </tr>
            </table>
        </td>
    </tr>
    </tr>
       <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/tree/master/labs/opsworks">OpsWorks CodePipeline Lab</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Automates the integration between AWS OpsWorks, CodeCommit and CodePipeline</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>EC2 Key Pair</li>
            </ol>
            <h6>Supported Regions</h6>
             <ol>
               <li>us-east-1</li>
             </ol>
            <h6>Create Details</h6>
            <ol>
             <li>IAM InstanceProfile, Policy, and Roles</li>
             <li>SecurityGroupIngress and SecurityGroup</li>
             <li>OpsWorks Stack, Layer, App and Instance</li>
             <li>CodePipeline</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/opsworks/codepipeline-opsworks.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-east-1&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/opsworks/codepipeline-opsworks.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/opsworks_codepipeline.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/opsworks/codepipeline-opsworks.json"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/opsworks/example-parameters.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/custom-parameters.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code> --parameters ParameterKey=KeyName,ParameterValue=stelligent-dev"</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
       <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/tree/master/labs/containers/docker/build">Containerized CI Solutions in AWS: Jenkins in ECS Lab</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Containerized CI Solutions in AWS: Jenkins in ECS</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>EC2 Key Pair</li>
            </ol>
            <h6>Supported Regions</h6>
             <ol>
               <li>us-east-1</li>
             </ol>
            <h6>Create Details</h6>
            <ol>
             <li>VPC and associated resources</li>
             <li>IAM</li>
             <li>EFS</li>
             <li>EC2 Instances</li>
             <li>Auto Scaling</li>
             <li>ELB</li>
             <li>ECS Service, Cluster, Task Definition</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/containers/docker/build/ecs-jenkins.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-east-1&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/containers/docker/build/ecs-jenkins.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/ecs-jenkins.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/containers/docker/build/ecs-jenkins.json"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/containers/docker/build/example-parameters.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/custom-parameters.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code> --parameters ParameterKey=AvailabilityZone1,ParameterValue=us-east-1c ParameterKey=AvailabilityZone2,ParameterValue=us-east-1d ParameterKey=KeyPair,ParameterValue=stelligent-dev ParameterKey=PublicAccessCIDR,ParameterValue=50.23.45.67/32"</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/tree/master/labs/codebuild">CodeBuild and AWS Developer Tools SuiteLab</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Automates the integration between AWS CodeBuild, CodeCommit, CodeDeploy, and CodePipeline</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>EC2 Key Pair</li>
            </ol>
            <h6>Supported Regions</h6>
             <ol>
               <li>us-east-1</li>
             </ol>
            <h6>Create Details</h6>
            <ol>
             <li>IAM Roles</li>
             <li>EC2 instance (for CodeDeploy)</li>
             <li>CodeCommit</li>
             <li>CodeDeploy</li>
             <li>CodePipeline</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#cstack=sn%7ECodeBuildPipelineStack%7Cturl%7Ehttps://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/codebuild/codebuild-cpl-cd-cc.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-east-1&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/codebuild/codebuild-cpl-cd-cc.json" target="_blank"><img src="https://d2908q01vomqb2.cloudfront.net/77de68daecd823babbb58edb1c8e14d7106e83bb/2016/12/13/Figure_2_Post_2_Stelligent_CodeBuild-1024x738.png" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://www.youtube.com/watch?v=8YLcNczTZkE" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/codebuild/codebuild-cpl-cd-cc.json"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/codebuild/example-parameters.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/custom-parameters.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code> --parameters ParameterKey=EC2KeyPairName,ParameterValue=stelligent-dev ParameterKey=RepositoryBranch,ParameterValue=master ParameterKey=EmailAddress,ParameterValue=youremailaddress@example.com</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/tree/master/labs/codepipeline">CodePipeline Approvals Labs</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Adds a Manual Approval to a CodePipeline</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>CodeCommit Repository</li>
            </ol>
            <h6>Supported Regions</h6>
             <ol>
               <li>us-east-1</li>
             </ol>
            <h6>Create Details</h6>
            <ol>
             <li>IAM Policy and Roles</li>
             <li>AWS Lambda Function</li>
             <li>SNS</li>
             <li>CodePipeline</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#cstack=sn%7ECodePipelineApprovals%7Cturl%7Ehttps://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/codepipeline/codepipeline-updates-after.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-east-1&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/codepipeline/codepipeline-updates-after.json" target="_blank"><img src="https://d2908q01vomqb2.cloudfront.net/77de68daecd823babbb58edb1c8e14d7106e83bb/2016/12/13/Figure_2_Post_2_Stelligent_CodeBuild-1024x738.png" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://www.youtube.com/watch?v=8YLcNczTZkE" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/codepipeline/codepipeline-updates-after.json"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/codepipeline/example-parameters.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/custom-parameters.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code> --parameters ParameterKey=EmailAddress,ParameterValue=youremail@example.com ParameterKey=RepositoryBranch,ParameterValue=master ParameterKey=RepositoryName,ParameterValue=codecommit-demo</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>


    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/tree/master/labs/ecs">EC2 Container Service Lab</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Automates the integration between EC2 Container Service (ECS), EC2 Container Registry (ECR), CodeCommit, and CodePipeline</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>EC2 Key Pair</li>
             <li>Existing Docker Image</li>
             <li>CodeCommit Repository</li>
             <li>ECR Repository</li>
            </ol>
            <h6>Supported Regions</h6>
             <ol>
               <li>us-east-1</li>
             </ol>
            <h6>Create Details</h6>
            <ol>
                <li>Virtual Private Cloud (VPC) (and associated resources)</li>
                <li>Auto Scaling Group, Auto Scaling Launch Configuration</li>
                <li>ECS Cluster, ECS Service, ECS Task Definition</li>
                <li>Elastic Load Balancer</li>
                <li>IAM Instance Profile, IAM Roles</li>
                <li>EC2 Instance (Jenkins, Docker)</li>
                <li>CodePipeline with CodeCommit Integration</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/ecs/ecs-pipeline.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-east-1&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/ecs/ecs-pipeline.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/ecs_codepipeline.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/ecs/ecs-pipeline.json"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/ecs/example-parameters.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/custom-parameters.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code> --parameters ParameterKey=RepositoryName,ParameterValue=YOURCCREPO ParameterKey=RepositoryBranch,ParameterValue=master ParameterKey=KeyName,ParameterValue=YOUREC2KEYPAIR ParameterKey=YourIP,ParameterValue=YOURIP/32 ParameterKey=ECSRepoName,ParameterValue=YOURECRREPO ParameterKey=ECSCFNURL,ParameterValue=NOURL ParameterKey=AppName,ParameterValue=app-name-1648"</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/test_instances/rhel-ubuntu-win2012.template">Test Instances</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Creates three test instances in an existing VPC. Each instance is a different operating system. They are; Red Hat Enterprise Linux 7, Ubuntu 14 and Windows 2012 R2.</p>
            <h6>Create Details</h6>
            <ol>
             <li>3 EC2 Instances</li>
             <li>IAM Role</li>
             <li>IAM Instance Profile</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/test_instances/rhel-ubuntu-win2012.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/test_instances/rhel-ubuntu-win2012.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/test_instances/rhel-ubuntu-win2012.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/test-instances-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/test_instances/rhel-ubuntu-win2012.template"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/test_instances/example-parameters.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/custom-parameters.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code>--parameters ... COMING SOON</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/spa/pipeline.yml">Pipeline for Single-Page Appliation</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Creates an S3 bucket to host a single-page application and a continuous delivery pipeline with CodeBuild and CodePipeline.</p>
            <h6>Prerequisites</h6>
            <ol>
             <li><a href="https://github.com/settings/tokens">GitHub token</a>
            </ol>
            <h6>Supported Regions</h6>
            <ol>
             <li>us-east-1</li>
             <li>us-west-2</li>
            </ol>
            <h6>Create Details</h6>
            <ol>
             <li>IAM Role for CodePipeline</li>
             <li>IAM Role for CodeBuild</li>
             <li>S3 Bucket</li>
             <li>CodeBuild Project</li>
             <li>CodePipeline Project</li>
            </ol>

        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/spa/pipeline.yml" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-west-2</p>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/spa/pipeline.yml" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
                        <p>us-east-1</p>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
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
                        <h6>Base Command</h6>
                        <code>aws cloudformation create-stack --profile {AWS Profile Name} --stack-name {Stack Name} --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/spa/pipeline.yml"</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Parameters</h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 1 - Custom Parameters JSON File <a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/spa/example-parameters.json">(Example Here)</a></h6>
                        <code>--parameters file:///localpath/to/custom-parameters.json</code>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Option 2 - Pass Parameters on CLI</h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <code>--parameters ParameterKey=SiteBucketName,ParameterValue=my-bucket-name ParameterKey=GitHubToken,ParameterValue=XXXXXXXXX</code>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

[Back to Top](#purpose)
