# Database CloudFormation Templates

## Purpose

Collection of Database Templates that use various nested templates from this repository.

## Templates

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