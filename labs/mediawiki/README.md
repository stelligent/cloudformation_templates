# Mediawiki on Nginx

## Purpose

Create an EC2 Instance on a Private Subnet, install Nginx, Php-Fpm and Mediawiki on Nginx.
Designed to use MySQL RDS backend, live behind a Load Balancer (Sophos, ELB, etc.), and 
configured for SSL termination is handled by the Load Balancer.

From the web it's HTTPS (443) to LB. Then from the LB to the instance it is HTTP (80).

# Prerequisites
* Create RDS Instance
* Create empty Mediawiki Database and User
* Internet Access from EC2 Instance

# Summary
1. AWS Service APIs (i.e. CFN Init, ECS, SNS, SES)
2. AWS Linux Package Repos
3. *.rubygems.org
4. *.wordpress.org, *.wordpress.com (Wordpress Updates)
5. docs.google.com (Temp) for Sheets access (Wordpress Plugin)

# Launcher
[![](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png)](https://console.aws.amazon.com/cloudformation/home?#/stacks/new?&templateURL=https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/mediawiki-nginx.yml)<br>
Click this button to open AWS CloudFormation web console to enter parameters and create the stack.


# CloudFormation Template Details
The [CloudFormation Template](https://github.com/stelligent/cloudformation_templates/blob/master/labs/mediawiki/mediawiki-nginx.yml) does the following:

1. EC2 Instance
    1. Amazon Linux
    2. EBS volume
    3. t2.micro (default)
    4. Private Subnet
    5. No External IP
2. Security Group
    1. Allow 80 Inbound
    2. Allow 443 Inbound
3. CloudWatch Logs Group
4. IAM Instance Profile Role
    1. S3 RW Access
    2. Cloudwatch Write Metrics
    3. Cloudwatch Logs
    4. Route 53 Upsert
5. UserData (Bootstrapping)
    1. Yum Updates
    2. Install minimum packages
        1. cfn-init
        2. aws-cfn-bootstrap
        3. cloud-init
    3. Call cfn-init

# Cloud Init
1. Configure CFN INIT
2. Install_packages
    1. Install Nginx
    2. Install Php-Fpm 7.0
    3. Install MySQL 5.6 Client
    4. Download Latest Mediawiki
    5. Download Plugins
3. Configure Mediawiki
    1. Create Nginx Virtual Host Config
    2. Create Mediawiki Config
4. Configure Php-Fpm
    1. Replace apache user with nginx user
    2. Set Ownership on Logs Directory
5. Start/Restart Services
    1. php-fpm-7.0
    2. nginx
    3. Set both to start at boot
6. DNS Update Script
    1. Create Update DNS Script
7. Update DNS
    1. Run DNS Update Script
8. Warm EBS
    1. Use dd to warm EBS Volume

# Tips
1. I put this behind a Sophos United Threat Management (UTM) v9 Instance. I have a Template [HERE](https://github.com/stelligent/cloudformation_templates/blob/master/infrastructure/utm9.yml)
