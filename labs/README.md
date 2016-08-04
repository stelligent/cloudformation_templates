# Lab CloudFormation Templates

## Purpose

Collection of Laboratory Templates.

## Templates

### Labs

<table>
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/chef_compliance">Chef Compliance Lab</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
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
</table>