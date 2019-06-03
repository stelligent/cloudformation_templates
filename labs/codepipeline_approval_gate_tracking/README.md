# CodePipeline Approval Gate Tracking

### Components
- AWS resources deployed from the `cloudformation/approval_gate_tracking_lambda.yml` template.
- AWS CloudWatch Event Rule that is configured to listen for the `PutApprovalResult` CloudTrail API call. This is the specific API call that is made whenever someone performs the action of approving or rejecting an approval gate.
- AWS Lambda function that records the information about the approval gate action in the S3 bucket and sends out the SNS notification containing information about the event. This Lambda function gets triggered by the CloudWatch event rule whenever that `PutApprovalResult` API call is logged to CloudTrail. The Lambda function then consumes that CloudTrail information and performs the S3 recording and SNS notification tasks, as well as logs the data to the Lambda's CloudWatch log group.
- AWS SNS Topic used for sending email notifications whenever someone approves or rejects a CodePipeline approval gate. These email notifications contain information about the approval gate action including:
	- Pipeline name
	- Approval gate status (Approved or Rejected)
	- IAM user who performed the action
	- Date and time of action (EST time)
	- AWS region in which this occurred
	- AWS account ID
- AWS S3 Bucket that is used for recording dated entries every time someone approves or rejects an approval gate in any CodePipeline within the region.

### What Does This Provide?
- A dynamic, automated, and scalable approach to tracking CodePipeline approval gate actions within an AWS account. This solution is built and automated to work every CodePipeline deployed within a region and does not require additional configuration after deployment.
- Easily queryable and long term storage solution for the recording of CodePipeline approvals/rejections in the S3 bucket. Each recorded text file entry contains the unique CloudTrail log data captured by the approval gate API action performed and is organized by `PipelineApprovalGateActions/pipeline_name/year/month/day/approval_gate-status-time.txt`. An example of a recording looks like this:
```
PipelineApprovalGateActions/testing-pipeline/2019/05/23/dev-approval-APPROVED-11:50:45-AM.txt
```
- Teams can be notified via email whenever a CodePipeline approval gate is approved or rejected. Each email notification contains unique information about the approval gate action performed. An example of an email notification containing this information would look like this:
`
Approval Gate qa-approval for Pipeline testing-pipeline was Approved by arn:aws:sts::123456789012:assumed-role/OrgIamRole/newuser on May 23, 2019 12:01:25 PM inside the us-east-1 region in AWS Account 123456789012. Approval Gate Response Summary: I approve
`

### Steps for Deployment
1. Launch the `cloudformation/approval_gate_tracking_lambda.yml` CloudFormation stack.
2. Pass in a name for your AWS account into the `AccountAlias` parameter. This is the name that will be used as a prefix for the resources created within the template.
3. Pass in the an email address that you would like to use to receive notifications about approval gate actions performed. If you would prefer to not receive notifications, you can leave this parameter blank.