# Database CloudFormation Templates

## Purpose

Collection of Database Templates that use various nested templates from this repository.

## Templates

### Database

<table>
  <tbody>
    <tr>
      <th align="left">Template</th>
      <th align="left">Description</th>
      <th align="left">View in Designer</th>
      <th align="left">Launch</th>
    </tr>
    <tr>
      <td><a href="https://github.com/stelligent/cloudformation_templates/blob/master/database/mysql-rds.template">MySQL RDS</a></td>
      <td>
        <p>Creates a Chef Complianc Web server in a Public Subnet with Internet Gatewayy attached on an existing VPC.
         It then attaches an EIP and finally adds the instance to an existing instance-to-instance security group.</p>
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
      <td nowrap width="144">
        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/database/mysql-rds.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/chef-compliance-lab-200x200.jpg" width:100% alt="View in Designer"></a>
      </td>
      <td nowrap width="144">
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/database/mysql-rds.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-west-2</p>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/database/mysql-rds.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-east-1</p>
      </td>
    </tr>
  </tbody>
</table>