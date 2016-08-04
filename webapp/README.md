# Webapp CloudFormation Templates

## Purpose

Collection of Generic Webapp Templates.

## Templates

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