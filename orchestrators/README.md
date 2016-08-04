# Orchestrator CloudFormation Templates

## Purpose

Collection of Orchestration Templates that use various nested templates from this repository.

## Templates

### Orchestrators
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
             <li>Bastion Host (Optinoal)</li>
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