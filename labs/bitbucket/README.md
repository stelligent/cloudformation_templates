# Bitbucket Server Lab CloudFormation Template

<table>
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/bitbucket/bitbucket.yml">Bitbucket Lab</a></h4></th>
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
                <li>Either use an existing VPC Infrastructure or you can use the following <a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc.yml" target="_blank">VPC Template</a> to create a one.</li>
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
            <h6>Notes</h6>
            <ul>
             <li>It takes 5 to 10 minutes after instance is created to complete the Bitbucket setup</li>
            </ul>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/bitbucket/bitbucket.yml" target="_blank"><img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">View in Designer</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/bitbucket/bitbucket.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/bitbucket-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>    
