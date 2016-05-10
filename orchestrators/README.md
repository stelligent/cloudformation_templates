# Orchestrator CloudFormation Templates

## Purpose

Collection of Orchestration Templates that use various nested templates from this repository.

## Templates

### Orchestrators

<table>
  <tbody>
    <tr>
      <th align="left">Template</th>
      <th align="left">Description</th>
      <th align="left">View in Designer</th>
      <th align="left">Launch</th>
    </tr>
    <tr>
      <td><a href="https://github.com/stelligent/cloudformation_templates/blob/master/orchestrators/infrastructure.template">Infrastructure</a></td>
      <td>
        <p>Select the foundational pieces for building out an infrastructure from the ground up.</p>
        <h6>Create Details</h6>
        <ol>
         <li>VPC</li>
         <li>Nat Gateway (Optional)</li>
         <li>Bastion Host (Optinoal)</li>
         <li>VPN (Optional)</li></li>
        </ol>
      </td>
      <td nowrap width="144">
        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/orchestrators/infrastructure.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/vpc-200x200.jpg" width:100% alt="View in Designer"></a>
      </td>
      <td nowrap width="144">
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/orchestrators/infrastructure.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-west-2</p>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/orchestrators/infrastructure.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-east-1</p>
      </td>
    </tr>
  </tbody>
</table>