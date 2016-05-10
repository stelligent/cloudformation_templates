# Infrastructure CloudFormation Templates

## Purpose

Collection of Foundational Infrastructure Templates.

## Templates

### Infrastructure

<table>
  <tbody>
    <tr>
      <th align="left">Template</th>
      <th align="left">Description</th>
      <th align="left">View in Designer & HowTo Videos</th>
      <th align="left">Launch</th>
    </tr>
    <tr>
      <td><a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc.template">VPC</a></td>
      <td>
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
      <td nowrap width="144">
        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpc.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/vpc-200x200.jpg" width:100% alt="View in Designer"></a>
        </br></br>
        <a href="https://youtu.be/W20I3qj-Nyc" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="View in Designer"></a>
      </td>
      <td nowrap width="144">
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpc.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-west-2</p>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpc.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-east-1</p>
      </td>
    </tr>
    <tr>
      <td><a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/nat-gateway.template">NAT</a></td>
      <td>
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
      <td nowrap>
        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/nat-gateway.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/nat-gateway-200x200.jpg" width:100% alt="View in Designer"></a>
      </td>
      <td nowrap>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/nat-gateway.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-west-2</p>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/nat-gateway.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-east-1</p>
      </td>
    </tr>
    <tr>
      <td><a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/bastion.template">Bastion</a></td>
      <td>
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
         <li>Bastion Security Group</li>
        </ol>
      </td>
      <td nowrap>
        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/bastion.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/bastion-200x200.jpg" width:100% alt="View in Designer"></a>
      </td>
      <td nowrap>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/bastion.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png" width:144 alt="us-west-2"></a>
        <p>us-west-2</p>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/bastion.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-east-1</p>
      </td>
    </tr>
    <tr>
      <td><a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpn-bgp.template">VPN</a></td>
      <td>
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
              <li>Either use an existing VPC Infrastructure or you can use the following <a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.template" target="_blank">VPC Template</a> to create a one.</li>
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
      <td>
        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpn-bgp.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/vpn-bgp-200x200.jpg" width:100% alt="View in Designer"></a>
      </td>
      <td>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpn-bgp.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-west-2</p>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/infrastructure/vpn-bgp.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-east-1</p>
      </td>
    </tr>
  </tbody>
</table>