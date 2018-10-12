# IAM CloudFormation Templates

## Purpose

IAM Policies

Refer to [How do I use an MFA token to authenticate access to my AWS resources through the AWS CLI?](https://aws.amazon.com/premiumsupport/knowledge-center/authenticate-mfa-cli/)

Here's an example:

```aws sts get-session-token --serial-number arn-of-the-mfa-device --token-code code-from-token```

It might look like this (where `123456789012` is your AWS account id and `123456` is the 6-digit code provided by your MFA device):

```aws sts get-session-token --serial-number arn:aws:iam::123456789012:mfa/USERNAME--token-code 123456```

You'll get a response like this: 

TBD

```sudo vim .aws/credentials```

