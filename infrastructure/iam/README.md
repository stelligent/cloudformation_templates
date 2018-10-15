# IAM CloudFormation Templates

## Purpose

IAM Policies for restricting access to AWS resource unless MFA is present.

## Running from the Command Line

Refer to [How do I use an MFA token to authenticate access to my AWS resources through the AWS CLI?](https://aws.amazon.com/premiumsupport/knowledge-center/authenticate-mfa-cli/)

When running certain commands (e.g. EC2, IAM, etc.) from the command line, you will need to first authenticate against an MFA token and update your local credentials prior to running the commmands. 

To obtain temporary credentials, here's an example you run:

```aws sts get-session-token --serial-number arn-of-the-mfa-device --token-code code-from-token```

It might look like this (where `123456789012` is your AWS account id, `USERNAME` is your IAM username, and `123456` is the 6-digit code provided by your MFA device):

```aws sts get-session-token --serial-number arn:aws:iam::123456789012:mfa/USERNAME --token-code 123456```

You can obtain the full ARN for the `serial-number` by following these steps:

1. Go to your IAM console
2. Select your user
3. Select the **Security Credentials** tab
4. Copy the value from the *Assigned MFA device* field

You can obtain the full ARN for the `token-code` by going to your MFA device and getting the 6 digit code for your IAM user

When running the `aws sts get-session-token` command, you'll get a response like this: 

```{
"Credentials": {
    "SecretAccessKey": "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY",
    "SessionToken": "AQoDYXdzEJr...<remainder of security token>",
    "Expiration": "2018-10-11T10:09:50Z",
    "AccessKeyId": "ASIAIOSFODNN7EXAMPLE",
  }
}
```

If you used `aws configure` to configure your credentials, you can edit your configuration file by opening the credentials file:

```sudo vim .aws/credentials```

and adding/updating the `aws_access_key_id`, `aws_secret_access_key`, and `aws_session_token` values you obtained when running the `aws sts get-session-token` command.

```
[default]
output = json
region = us-east-1
aws_access_key_id = AKIAIOSFODNN7EXAMPLE
aws_secret_access_key = wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
aws_session_token = AQoDYXdzEJr...<remainder of security token>
```

Save the file and run your commands.

### Troubleshooting


Incorrect "Permanent" Credentials - when calling `aws sts get-session-token`: 

```An error occurred (InvalidClientTokenId) when calling the GetSessionToken operation: The security token included in the request is invalid.```

When running a command (e.g. in this case, `aws s3 ls`) from the AWS CLI without temporary credentials:

```An error occurred (AccessDenied) when calling the ListBuckets operation: Access Denied```

When running a `aws sts get-session-token --serial-number arn-of-the-mfa-device --token-code code-from-token` command from the AWS CLI using the wrong `--serial-number`: 

```An error occurred (AccessDenied) when calling the GetSessionToken operation: MultiFactorAuthentication failed, unable to validate MFA code.  Please verify your MFA serial number is valid and associated with this user.```


When entering the wrong MFA six-digit token for the `--serial-number` (e.g. ARN for the user): 

```An error occurred (AccessDenied) when calling the GetSessionToken operation: MultiFactorAuthentication failed with invalid MFA one time pass code.```

Incorrectly entering temporary session token: 

```An error occurred (InvalidToken) when calling the ListBuckets operation: The provided token is malformed or otherwise invalid.```

Incorrectly entering temporary credentials (e.g. AccessKeyId and/or SecretAccessKey):

```An error occurred (SignatureDoesNotMatch) when calling the ListBuckets operation: The request signature we calculated does not match the signature you provided. Check your key and signing method.```

Missing session token:

```An error occurred (InvalidAccessKeyId) when calling the ListBuckets operation: The AWS Access Key Id you provided does not exist in our records.```

Attempting to run the `aws sts get-session-token` command when the local credentials contain the session credentials:

```An error occurred (AccessDenied) when calling the GetSessionToken operation: Cannot call GetSessionToken with session credentials```

When launching a CloudFormation stack from the CLI. Here's an example you might see if access to SQS were denied without MFA: 

```API: sqs:CreateQueue Access to the resource https://sqs.us-east-1.amazonaws.com/ is denied.```

Invalid credentials when calling a specific command (e.g. in this case, `aws s3 ls`): 

```An error occurred (InvalidAccessKeyId) when calling the ListBuckets operation: The AWS Access Key Id you provided does not exist in our records.```

