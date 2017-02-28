# Stelligent CloudFormation Templates

## Purpose
This repository contains a collaboration of general and specific Amazon Web Services CloudFormation Template Examples.
The basic design is a layered approach so there is less repeat content between all the templates.
That way you can build a custom environment by picking the solution templates you wish to use.
In other words you won't see a VPC created over and over throughout the templates.
You simply use the VPC template then move to the next piece you would like to create.

Also, The general design leans towards not having to refactor the template to fit your account/environment.
By using the configured parameters from the console or CLI you should be able to use the template without the need to edit it.
The templates generally output all the information you may need for another template.
So, be sure to examine the **Outputs** tab after creating the stack.

The AWS CLI examples can be dropped in a shell script and/or added to your CI/CD solution to spin up solutions in a fully automated fashion.
Of course logic around updating stacks, deleting and checking for success/failure should be addressed.

With a simple shell script and a customized parameter json file you can spin up stacks quickly and consistently.
 Furthermore it's just as easy to tear a CloudFormation stack versus if all the objects where created manually.

## Templates

### Categories
* [Orchestrators](#orchestrators)
* [Infrastructure](#infrastructure)
* [Storage](#storage)
* [Database](#database)
* [Autoscaling](#autoscaling)
* [Labs](#labs)


### Orchestrators
[Back to Top](#purpose)

One template to rule them all... These are master templates that call nested templates.
These are good to build out a full environment without having to run each template individually.
Coupled with a custom parameters JSON file can give you a one command solution to a complex setup and eliminate the need to duplicate code.

For instance you could have a VPC, NAT, RDS and Autoscaling Webapp behind an ELB and Update DNS all in one
command using various foundational templates that I've creates to be used together.

<table width="100%">
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
            <h6>Public S3 URL</h6>
            <ol>
             <oi>https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/infrastructure.yml</li>
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

### Infrastructure
[Back to Top](#purpose)

<table width="100%">
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc.yml">VPC (Virtual Private Cloud)</a></h4></th>
    </tr>
    <tr>
        <td width="100%" valign="top">
           <p>Creates an entire VPC from scratch for Lab or Permanent.</p>
           <h6>Create Details</h6>
           <ol>
            <li>Single VPC</li>
            <li>3 Public Subnets</li>
            <li>3 Private Subnets</li>
            <li>Public Route Table</li>
            <li>Private Route Table</li>
            <li>Internet Gateway</li>
            <ul>
              <li>Attached to the Public Route Table</li>
            </ul>
            <li>Public Network ACL</li>
            <li>Private Network ACL</li>
            <li>VPC Endpoint</li>
            <li>Instance Access Security Group</li>
            <ul>
              <li>Instance to Instance Access</li>
            </ul>
            <li>Remote Access Security Group</li>
            <ul>
              <li>This can be used for to allow site-to-site VPN or Direct Connect Networks access to instances.</li>
            </ul>
           </ol>
            <h6>Public S3 URL</h6>
            <ol>
             <oi>https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/vpc.yml</li>
            </ol>
        </td>
        <td nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/vpc.yml" target="_blank"><img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">View in Designer</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/vpc.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/vpc-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://youtu.be/0bf2w0zSsWM" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<table width="100%">
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/nat-gateway.yml">NAT Gateway (Network Addresss Translation)</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Creates a NAT Gateway on an existing VPC with Public (IGW) and Private subnets. Private route table is updated to route traffic to the NAT gateway a Public subnet that has an Internet Gateway Attached.</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>VPC</li>
             <ul>
               <li>Public Subnet, IGW, Private Subnet/s.</li>
               <li>Either use an existing VPC Infrastructure or you can use the following <a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.yml" target="_blank">VPC Template</a> to create a one.</li>
             </ul>
            <li>AWS Privileges</li>
            </ol>
            <h6>Create Details</h6>
            <ol>
             <li>NAT Gateway</li>
             <li>EIP</li>
             <li>Add Route to Private Route Table</li>
            </ol>
            <h6>Advantages over NAT Instance</h6>
            <ol>
             <li>Redundancy built in.</li>
             <li>Easier setup and management.</li>
            </ol>
            <h6>Public S3 URL</h6>
            <ol>
             <oi>https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/nat-gateway.yml</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/nat-gateway.yml" target="_blank"><img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">View in Designer</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/nat-gateway.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/nat-gateway-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://youtu.be/YElJ_mI2-Ng" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<table width="100%">
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpn-bgp.yml">VPN BGP (Virtual Private Network using Border Gateway Protocol)</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Creates a Site-to-Site BGP VPN Connection in and existing VPC with public and/or private networks.
             There is an option to not exclude allowing VPN access to the public networks.
             Simply select false for the 'Include Public Subnets', leave default value in Public Network ACL and Route Table.
             The values will just be ignored. This only sets up the AWS side of the VPN.
             After the CloudFormation creates the objects you'll then need to configure your remote VPN Device.
             <a href="https://www.stelligent.com/wiki/HowTo:Setup_Site_to_Site_VPN_from_AWS_VPC_to_Sophos_UTM" target="_blank">Here's</a> an article that gives the configuration steps for configuring a Sophos UTM v9 VPN endpoint.
             This assumes that the Private Network ACL allows all outbound. Lastly, the Private Network ACL inbound is updated to allow the remote network block specified.</p>
             <h6>Prerequisites</h6>
             <ol>
                <li>VPC</li>
                <ul>
                  <li>Public Subnet, IGW, Private Subnet/s.</li>
                  <li>Either use an existing VPC Infrastructure or you can use the following <a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc.yml" target="_blank">VPC Template</a> to create a one.</li>
                </ul>
              <li>Remote Network (Office) VPN Device WAN IP</li>
              <li>Remote Network CIDR Block to Allow Access and Propagate.</li>
             </ol>
            <h6>Create Details</h6>
            <ol>
             <li>Customer Gateway</li>
             <li>Virtual Private Gateway</li>
             <li>VPN Connection</li>
             <li>Enable Route Propagation on Route Table/s</li>
             <li>Add Network ACL to Allow Remote Network</li>
            </ol>
            <h6>Public S3 URL</h6>
            <ol>
             <oi>https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/vpn-bgp.yml</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/vpn-bgp.yml" target="_blank"><img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">View in Designer</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/vpn-bgp.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/vpn-bgp-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://youtu.be/DCprX10Xaco" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<table width="100%">
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/bastion.yml">Bastion</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Creates a single Bastion host on a Public subnet in an existing VPC. Select from either a RHEL, Ubuntu or Windows OS.</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>VPC</li>
             <ul>
               <li>Public Subnet, IGW, Private Subnet/s.</li>
               <li>Either use an existing VPC Infrastructure or you can use the following <a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc/vpc.yml" target="_blank">VPC Template</a> to create a one.</li>
             </ul>
            <li>Available EIP</li>
            </ol>
            <h6>Create Details</h6>
            <ol>
             <li>EC2 Instance</li>
             <li>EIP</li>
             <li>IAM Role</li>
             <li>IAM Instance Profile</li>
             <li>Security Group</li>
            </ol>
            <h6>Public S3 URL</h6>
            <ol>
             <oi>https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/bastion.yml</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/bastion.yml" target="_blank"><img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png" width:144 alt="us-west-2"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">View in Designer</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/bastion.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/bastion-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<table width="100%">
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/proxy-awsapi-devops-access.yml">Proxy AWSAPI & DevOps Sites Access for Private Instances</a></h4></th>
    </tr>
    <tr>
        <td width="100%" valign="top">
            <p>Create EC2 Single Proxy Instance</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>VPC</li>
             <li>1 Public Subnet</li>
            </ol>
            <h6>CloudFormation Tasks</h6>
            <ol>
             <li>Create Single EC2 Instance on Public Network with Public IP</li>
             <li>Create Autoscaling Group of 1 for DR</li>
             <li>Create Proxy Access Security Group</li>
             <li>Install Chef Client</li>
             <li>Create Chef Configurations Files (environment, roles, etc.)</li>
             <li>Download Cookbooks from Github Repo</li>
             <li>Checkout Specific Version of Cookbook</li>
             <li>Run Chef Client using Chef Zero</li>
             <li>Warm EBS Volume</li>
            </ol>
            <h6>Chef Cookbook Tasks</h6>
            <ol>
             <li>Install, Configure and Start Squid Proxy</li>
             <li>Setup CloudWatch Logs</li>
             <li>Create Route53 DNS Update Script</li>
             <li>Configure DNS Update Cron Job</li>
            </ol>
        </td>
        <td nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/proxy-awsapi-devops-access.yml" target="_blank"><img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

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
            <h6>Public S3 URL</h6>
            <ol>
             <oi>https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/efs.yml</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
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

### Database
[Back to Top](#purpose)

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
            <h6>Public S3 URL</h6>
            <ol>
             <oi>https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/mysql-rds.yml</li>
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
            <h6>Public S3 URL</h6>
            <ol>
             <oi>https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/create-rds-from-snapshot.yml</li>
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

### Autoscaling
[Back to Top](#purpose)

<table width="100%">
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/autoscaling/bakedami-elb-rdsbackend.yml">Baked AMI, ELB, RDS Backend</a></h4></th>
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
            <h6>Public S3 URL</h6>
            <ol>
             <oi>https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/autoscaling-bakedami-rdsbackend.yml</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/autoscaling-bakedami-rdsbackend.yml" target="_blank"><img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">View in Designer</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/autoscaling-bakedami-rdsbackend.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/autoscaling-bakedami-rdsbackend-200x181.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>    

### Labs
[Back to Top](#purpose)

<table width="100%">   
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
            <h6>Public S3 URL</h6>
            <ol>
             <oi>https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/bitbucket.yml</li>
            </ol>
        </td>
        <td nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/bitbucket.yml" target="_blank"><img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">View in Designer</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/bitbucket.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/bitbucket-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table> 
    
<table width="100%">  
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/tree/master/labs/lambda">AWS Lambda CodePipeline Lab</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Automates the integration between AWS Lambda and CodePipeline</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>N/A</li>
            </ol>
            <h6>Supported Regions</h6>
             <ol>
               <li>us-east-1</li>
             </ol>
            <h6>Create Details</h6>
            <ol>
             <li>IAM Policy and Roles</li>
             <li>Lambda Function</li>
             <li>CodePipeline</li>
            </ol>
            <h6>Public S3 URL</h6>
            <ol>
             <oi>https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/lambda-codepipeline.json</li>
            </ol>
        </td>
        <td nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/lambda/lambda-codepipeline.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-east-1&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/lambda/lambda-codepipeline.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/lambda-codepipeline.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>    

<table width="100%">   
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
            <h6>Public S3 URL</h6>
            <ol>
             <oi>https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/bitbucket.yml</li>
            </ol>
        </td>
        <td nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/bitbucket.yml" target="_blank"><img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">View in Designer</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/bitbucket.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/bitbucket-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table> 

<table width="100%">
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/chef">Chef Compliance Lab</a></h4></th>
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
               <li>Either use an existing VPC Infrastructure or you can use the following <a href="https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/vpc.yml" target="_blank">VPC Template</a> to create a one.</li>
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
            <h6>Public S3 URL</h6>
            <ol>
             <oi>https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/chef-compliance.yml</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/chef-compliance.yml" target="_blank"><img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">View in Designer</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/chef-compliance.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/chef-compliance-lab-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table> 

<table width="100%">
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/tree/master/labs/codebuild">CodeBuild and AWS Developer Tools SuiteLab</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Automates the integration between AWS CodeBuild, CodeCommit, CodeDeploy, and CodePipeline</p>
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
             <li>IAM Roles</li>
             <li>EC2 instance (for CodeDeploy)</li>
             <li>CodeCommit</li>
             <li>CodeDeploy</li>
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
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#cstack=sn%7ECodeBuildPipelineStack%7Cturl%7Ehttps://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/codebuild/codebuild-cpl-cd-cc.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-east-1&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/codebuild/codebuild-cpl-cd-cc.json" target="_blank"><img src="https://d2908q01vomqb2.cloudfront.net/77de68daecd823babbb58edb1c8e14d7106e83bb/2016/12/13/Figure_2_Post_2_Stelligent_CodeBuild-1024x738.png" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://www.youtube.com/watch?v=8YLcNczTZkE" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<table width="100%">
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
        </td>
    </tr>
</table>    
    
<table width="100%">
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/tree/master/labs/codepipeline">CodePipeline Approvals Labs</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Adds a Manual Approval to a CodePipeline</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>CodeCommit Repository</li>
            </ol>
            <h6>Supported Regions</h6>
             <ol>
               <li>us-east-1</li>
             </ol>
            <h6>Create Details</h6>
            <ol>
             <li>IAM Policy and Roles</li>
             <li>AWS Lambda Function</li>
             <li>SNS</li>
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
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#cstack=sn%7ECodePipelineApprovals%7Cturl%7Ehttps://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/codepipeline/codepipeline-updates-after.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-east-1&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/codepipeline/codepipeline-updates-after.json" target="_blank"><img src="https://d2908q01vomqb2.cloudfront.net/77de68daecd823babbb58edb1c8e14d7106e83bb/2016/12/13/Figure_2_Post_2_Stelligent_CodeBuild-1024x738.png" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">How To Video</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://www.youtube.com/watch?v=8YLcNczTZkE" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/screenshots/HowTo_Stelligent_YouTube_144x81.jpg" width:100% alt="HowTo Video"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<table width="100%">
     <tr>
         <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/tree/master/labs/containers/docker/build">Containerized CI Solutions in AWS: Jenkins in ECS Lab</a></h4></th>
     </tr>
     <tr>
         <td valign="top">
             <p>Containerized CI Solutions in AWS: Jenkins in ECS</p>
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
              <li>VPC and associated resources</li>
              <li>IAM</li>
              <li>EFS</li>
              <li>EC2 Instances</li>
              <li>Auto Scaling</li>
              <li>ELB</li>
              <li>ECS Service, Cluster, Task Definition</li>
             </ol>
         </td>
         <td  nowrap width="200" valign="top">
             <table>
                 <tr>
                     <th align="left">Launch</th>
                 </tr>
                 <tr>
                     <td>
                         <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/containers/docker/build/ecs-jenkins.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                         <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-east-1&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/containers/docker/build/ecs-jenkins.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/ecs-jenkins.jpg" width:100% alt="View in Designer"></a>
                     </td>
                 </tr>
             </table>
         </td>
     </tr>
</table>  

<table width="100%">
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/tree/master/labs/ecs">EC2 Container Service Lab</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Automates the integration between EC2 Container Service (ECS), EC2 Container Registry (ECR), CodeCommit, and CodePipeline</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>EC2 Key Pair</li>
             <li>Existing Docker Image</li>
             <li>CodeCommit Repository</li>
             <li>ECR Repository</li>
            </ol>
            <h6>Supported Regions</h6>
             <ol>
               <li>us-east-1</li>
             </ol>
            <h6>Create Details</h6>
            <ol>
                <li>Virtual Private Cloud (VPC) (and associated resources)</li>
                <li>Auto Scaling Group, Auto Scaling Launch Configuration</li>
                <li>ECS Cluster, ECS Service, ECS Task Definition</li>
                <li>Elastic Load Balancer</li>
                <li>IAM Instance Profile, IAM Roles</li>
                <li>EC2 Instance (Jenkins, Docker)</li>
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
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/ecs/ecs-pipeline.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-east-1&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/ecs/ecs-pipeline.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/ecs_codepipeline.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<table width="100%">
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
        </td>
    </tr>
</table> 

<table width="100%">
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/tree/master/labs/mediawiki">Mediawiki on Nginx</a></h4></th>
    </tr>
    <tr>
        <td width="100%" valign="top">
            <p>Create S3 Backup Bucket</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>VPC</li>
             <li>Public Subnet</li>
             <li>Internal Access Security Group</li>
             <li>RDS Security Group</li>
             <li>EFS Security Group</li>
            </ol>
            <h6>Create Details</h6>
            <ol>
             <li>Single Amazon Linux EC2 Instance</li>
             <li>Create Web Access Security Group</li>
             <li>Create IAM Instance Profile Role</li>
             <li>Create CloudWatch Logs Group</li>
             <li>No External IP</li>
            </ol>
            <h6>Deploy Details</h6>
            <ol>
             <li>Installs Nginx</li>
             <li>Installs PHP-FPM 7.0</li>
             <li>Installs MySQL 5.6 Client</li>
             <li>Installs Specfic Release of Mediawiki (Default REL1_28)</li>
             <li>Installs Creates Nginx Config for Mediawiki</li>
             <li>Assumes RDS Backend</li>
             <li>Assumes EFS Shared Content Mount</li>
            </ol>
        </td>
        <td nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/mediawiki-nginx.yml" target="_blank"><img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
  
<table width="100%"> 
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/codepipeline/codepipeline-canonical.yml">Mock Stages and Actions in AWS CodePipeline and AWS Lambda</a></h4></th>
    </tr>
    <tr>
        <td valign="top">
            <p>Creates a deployment pipeline in AWS CodePipeline using a pre-built Lambda function. It can be used to model a pipeline without initial implementation</p>
            <h6>Prerequisites</h6>
              <ol>
                <li>AWS Account</li>
              </ol>
            <h6>Supported Regions</h6>
             <ol>
               <li>us-east-1</li>
             </ol>
            <h6>Create Details</h6>
            <ol>
             <li>Amazon S3 bucket for CodePipeline artifacts</li>
             <li>AWS SNS Topic</li>
             <li>AWS IAM Policy and Roles</li>
             <li>AWS Lambda Function</li>
             <li>AWS CodePipeline Stages and Actions</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/codepipeline/codepipeline-canonical.yml" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
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
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-east-1&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/codepipeline/codepipeline-canonical.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/codepipeline_mock_designer.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table> 
    
<table width="100%">
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
        </td>
    </tr>
</table> 
   
<table width="100%">
    <tr>
       <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/spa/pipeline.yml">Pipeline for Single-Page Appliation</a></h4></th>
    </tr>
    <tr>
       <td valign="top">
           <p>Creates an S3 bucket to host a single-page application and a continuous delivery pipeline with CodeBuild and CodePipeline.</p>
           <h6>Prerequisites</h6>
           <ol>
            <li><a href="https://github.com/settings/tokens">GitHub token</a> (with access to repo and admin:repo_hook) 
           </ol>
           <h6>Supported Regions</h6>
           <ol>
            <li>us-east-1</li>
            <li>us-west-2</li>
           </ol>
           <h6>Create Details</h6>
           <ol>
            <li>IAM Role for CodePipeline</li>
            <li>IAM Role for CodeBuild</li>
            <li>S3 Bucket</li>
            <li>CodeBuild Project</li>
            <li>CodePipeline Project</li>
           </ol>
       </td>
       <td  nowrap width="200" valign="top">
           <table>
               <tr>
                   <th align="left">Launch</th>
               </tr>
               <tr>
                   <td>
                       <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/spa/pipeline.yml" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
                       <p>us-west-2</p>
                       <a href="https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/spa/pipeline.yml" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/images/buttons/cloudformation-launch-stack-button.png"></a>
                       <p>us-east-1</p>
                   </td>
               </tr>
           </table>
       </td>
    </tr>
</table>
   
<table width="100%">   
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/blob/master/labs/test_instances/rhel-ubuntu-win2012.yml">Test Instances</a></h4></th>
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
            <h6>Public S3 URL</h6>
            <ol>
             <oi>https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/rhel-ubuntu-win2012.yml</li>
            </ol>
        </td>
        <td  nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/rhel-ubuntu-win2012.yml" target="_blank"><img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png"></a>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th align="left">View in Designer</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/designer/home?region=us-west-2&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/rhel-ubuntu-win2012.json" target="_blank"><img src="https://s3.amazonaws.com/stelligent-public/media/cloudformation-diagrams/test-instances-200x200.jpg" width:100% alt="View in Designer"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<table width="100%">
    <tr>
        <th align="left" colspan="2"><h4><a href="https://github.com/stelligent/cloudformation_templates/tree/master/labs/wordpress">Wordpress on Nginx</a></h4></th>
    </tr>
    <tr>
        <td width="100%" valign="top">
            <p>Create S3 Backup Bucket</p>
            <h6>Prerequisites</h6>
            <ol>
             <li>VPC</li>
             <li>Public Subnet</li>
             <li>Internal Access Security Group</li>
             <li>RDS Security Group</li>
             <li>EFS Security Group</li>
            </ol>
            <h6>Create Details</h6>
            <ol>
             <li>Single Amazon Linux EC2 Instance</li>
             <li>Create Web Access Security Group</li>
             <li>Create IAM Instance Profile Role</li>
             <li>Create CloudWatch Logs Group</li>
             <li>No External IP</li>
            </ol>
            <h6>Deploy Details</h6>
            <ol>
             <li>Installs Nginx</li>
             <li>Installs PHP-FPM 7.0</li>
             <li>Installs MySQL 5.6 Client</li>
             <li>Installs Latest Wordpress</li>
             <li>Installs Creates Nginx Config for Wordpress</li>
             <li>Assumes RDS Backend</li>
             <li>Assumes EFS Shared Content Mount</li>
            </ol>
        </td>
        <td nowrap width="200" valign="top">
            <table>
                <tr>
                    <th align="left">Launch</th>
                </tr>
                <tr>
                    <td>
                        <a href="https://console.aws.amazon.com/cloudformation/home?#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/wordpress-nginx.yml" target="_blank"><img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

[Back to Top](#purpose)
