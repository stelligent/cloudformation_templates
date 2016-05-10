# Webapp CloudFormation Templates

## Purpose

Collection of Generic Webapp Templates.

## Templates

### Autoascaling

<table>
  <tbody>
    <tr>
      <th align="left">Template</th>
      <th align="left">Description</th>
      <th align="left">View in Designer</th>
      <th align="left">Launch</th>
    </tr>
    <tr>
      <td><a href="https://github.com/stelligent/cloudformation_templates/blob/master/webapp/autoscaling-bakedami-rdsbackend.template">Baked AMI, RDS Backend</a></td>
      <td>
        <p>Create an Autoscaling group in 3 private subnets from a baked AMI, an Elastic Load Balancer in 3 public subnets and S3 ELB Logging Bucket.
        Option to use SSL/TLS on ELB. Option to update Route 53 Hosted DNS alias to point to the ELB.
        Setup to add RDS Access Security Group. Does not create an RDS Instance. Use an RDS Instance Cloudformation Template first.</p>
      </td>
      <td nowrap width="144">
        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/webapp/autoscaling-bakedami-rdsbackend.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/autoscaling-bakedami-rdsbackend-200x181.jpg" width:100% alt="View in Designer"></a>
      </td>
      <td nowrap width="144">
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/webapp/autoscaling-bakedami-rdsbackend.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-west-2</p>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/webapp/autoscaling-bakedami-rdsbackend.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-east-1</p>
      </td>
    </tr>
    <tr>
      <td><a href="https://github.com/stelligent/cloudformation_templates/blob/master/webapp/autoscaling-bakedami.template">Baked AMI</a></td>
      <td>
        <p>Create an Autoscaling group in 3 private subnets from a baked AMI, an Elastic Load Balancer in 3 public subnets and S3 ELB Logging Bucket.
        Option to use SSL/TLS on ELB. Option to update Route 53 Hosted DNS alias to point to the ELB.</p>
      </td>
      <td nowrap width="144">
        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/webapp/autoscaling-bakedami.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/cfn-diagrams/autoscaling-bakedami-200x181.jpg" width:100% alt="View in Designer"></a>
      </td>
      <td nowrap width="144">
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/webapp/autoscaling-bakedami.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-west-2</p>
        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public-cloudformation-templates/github/webapp/autoscaling-bakedami.template" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public-media/images/buttons/cloudformation-launch-stack-button.png"></a>
        <p>us-east-1</p>
      </td>
    </tr>
  </tbody>
</table>