# Database CloudFormation Templates

## Purpose

Collection of Database Templates that use various nested templates from this repository.

## Templates

### Database

<table width="100%">
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/storage/mysql-rds.yml">MySQL RDS</a></h4></th>
    </tr>
    <tr>
        <td width="100%" valign="top">
           <p>Creates a MySQL RDS Database Instance.</p>
           <h6>Prerequisites</h6>
           <ol>
            <li>VPC</li>
            <ul>
              <li>Public Subnet, IGW, Private Subnet/s.</li>
              <li>Either use an existing VPC Infrastructure or you can use the following <a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc.yml" target="_blank">VPC Template</a> to create a one.</li>
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
        <td nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/mysql-rds.yml" target="_blank"><img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
    
<table width="100%">    
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/storage/create-rds-from-snapshot.yml">Create RDS From Snapshot</a></h4></th>
    </tr>
    <tr>
        <td width="100%" valign="top">
            <p>Creates an RDS Instance From Snapshot. Can be great for Blue/Green or pull Prd DB to Nonprod for testing.</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>RDS Snapshot in Same Region</li>
             <li>2+ Subnets if Enabling Multi AZ</li>
            </ol>
            <h6>Create Details</h6>
            <ol>
             <li>Create RDS Instance from Snapshot</li>
             <li>Create Subnet Group</li>
             <li>Create Access Security Group</li>
             <li>Optionally Configure DNS Record in Route53</li>
            </ol>
            <h6>Notes</h6>
            <ol>
             <li>Because it's a restore several options are not available. Such as:</li>
             <ol>
                 <li>Can't set Master User and Password</li>
                 <li>Can't select what DB Engine</li>
                 <li>Can't set allocated storage</li>
                </ol>
            </ol>
        </td>
        <td nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/create-rds-from-snapshot.yml" target="_blank"><img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>