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
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/orchestrators/infrastructure.yml">Infrastructure</a></h4></th>
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
                        <a href="https://console.aws.amazon.com/cloudformation/home?#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/infrastructure.yml" target="_blank"><img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">View in Designer</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/infrastructure.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/infra-orchestrator-600x600.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>