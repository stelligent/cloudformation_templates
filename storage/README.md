# Storage CloudFormation Templates

## Purpose

Collection of Storage Templates that can use various nested templates from this repository.

### Storage
[Back to Top](#purpose)

<table width="100%">
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/storage/efs.yml">EFS</a></h4></th>
    </tr>
    <tr>
        <td width="100%" valign="top">
            <p>Creates an Elastic File System with 3 Mounts</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>VPC</li>
             <li>3 Subnets</li>
            </ol>
            <h6>Create Details</h6>
            <ol>
             <li>EFS Filesystem</li>
             <li>3 Mount Targets</li>
            </ol>
        </td>
        <td nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/efs.yml" target="_blank"><img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<table width="100%">
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/storage/s3-backup-bucket-delete-previous.yml">S3 Backup Bucket</a></h4></th>
    </tr>
    <tr>
        <td width="100%" valign="top">
            <p>Create S3 Backup Bucket</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>VPC</li>
             <li>VPC Endpoint</li>
            </ol>
            <h6>Create Details</h6>
            <ol>
             <li>Single S3 Bucket</li>
             <li>Enabled Versioning</li>
             <li>Enforced Encryption</li>
             <li>Creates LifeCycle to Delete Previous Versions after X Days</li>
            </ol>
        </td>
        <td nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/s3-backup-bucket-delete-previous.yml" target="_blank"><img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
