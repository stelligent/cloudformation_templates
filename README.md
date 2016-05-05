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

## Templates

### Infrastructure

<table>
  <tbody>
    <tr>
      <th align="left">Template</th>
      <th align="left">Description</th>
      <th align="left">View in Designer</th>
      <th align="left">Launch</th>
    </tr>
    <tr>
      <td nowrap><a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template">VPC</a></td>
      <td>
        Creates an entire VPC from scratch for Lab or Permanent. Creates a New VPC,
         3 Public Subnets, 3 Private Subnets, Route Tables, Public Network ACLs,
         Private Network ACLs, Internet Gateway attached to Public Subnets,
         Instance to Instance Security Group and Remote Access Security Group.
      </td>
      <td nowrap width="144">
        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpc/vpc.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/vpc-200x200.jpg" width:100% alt="View in Designer"></a>
      </td>
      <td nowrap width="144">
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpc/vpc.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-west-2</p>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpc/vpc.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-east-1</p>
      </td>
    </tr>
    <tr>
      <td nowrap><a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/nat/nat-gateway.template">NAT Gateway</a></td>
      <td>
        Creates a NAT Gateway on an existing VPC with Public (IGW) and Private subnets. Private route table is updated to route traffic to the NAT gateway a Public subnet that has an Internet Gateway Attached.
      </td>
      <td nowrap>
        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/nat/nat-gateway.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/nat-gateway-200x200.jpg" width:100% alt="View in Designer"></a>
      </td>
      <td nowrap>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/nat/nat-gateway.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-west-2</p>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/nat/nat-gateway.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-east-1</p>
      </td>
    </tr>
    <tr>
      <td nowrap><a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/bastion/bastion.template">Bastion Host</a></td>
      <td>
        Creates a single Bastion host on a Public subnet in an existing VPC. Select from either a RHEL, Ubuntu or Windows OS.
      </td>
      <td nowrap>
        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/bastion/bastion.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/bastion-200x200.jpg" width:100% alt="View in Designer"></a>
      </td>
      <td nowrap>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/bastion/bastion.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png" width:144 alt="us-west-2"></a>
        <p>us-west-2</p>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/bastion/bastion.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-east-1</p>
      </td>
    </tr>
    <tr>
      <td><a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpn/vpn-bgp.template">VPN BGP</a></td>
      <td>
        Creates a Site-to-Site BGP VPN Connection in and existing VPC with public and/or private networks.
         There is an option to not exclude allowing VPN access to the public networks.
         Simply select false for the 'Include Public Subnets', leave default value in Public Network ACL and Route Table.
         The values will just be ignored. This only sets up the AWS side of the VPN.
         After the CloudFormation creates the objects you'll then need to configure your remote VPN Device.
         <a href="https://www.bonusbits.com/wiki/HowTo:Setup_Site_to_Site_VPN_from_AWS_VPC_to_Sophos_UTM" target="_blank">Here's</a> an article that gives the configuration steps for configuring a Sophos UTM v9 VPN endpoint.
         This assumes that the Private Network ACL allows all outbound. Lastly, the Private Network ACL inbound is updated to allow the remote network block specified.
      </td>
      <td>
        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpn/vpn-bgp.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/vpn-bgp-200x200.jpg" width:100% alt="View in Designer"></a>
      </td>
      <td>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpn/vpn-bgp.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-west-2</p>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpn/vpn-bgp.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-east-1</p>
      </td>
    </tr>
  </tbody>
</table>

### Labs

<table>
  <tbody>
    <tr>
      <th align="left">Template</th>
      <th align="left">Description</th>
      <th align="left">View in Designer</th>
      <th align="left">Launch</th>
    </tr>
    <tr>
      <td nowrap><a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/chef_compliance">Chef Compliance Lab</a></td>
      <td>
        Creates a Chef Complianc Web server in a Public Subnet with Internet Gatewayy attached on an existing VPC.
         It then attaches an EIP and finally adds the instance to an existing instance-to-instance security group.
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
      <td nowrap><a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/test_instances/rhel-ubuntu-win2012.template">Test Instances</a></td>
      <td>
        Creates three test instances in an existing VPC. Each instance is a different operating system. They are; Red Hat Enterprise Linux 7, Ubuntu 14 and Windows 2012 R2.
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