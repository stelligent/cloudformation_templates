# IAM CloudFormation Templates

## Purpose

IAM Policies


## Running from the Command Line

Refer to [How do I use an MFA token to authenticate access to my AWS resources through the AWS CLI?](https://aws.amazon.com/premiumsupport/knowledge-center/authenticate-mfa-cli/)

Here's an example:

```aws sts get-session-token --serial-number arn-of-the-mfa-device --token-code code-from-token```

It might look like this (where `123456789012` is your AWS account id, `USERNAME` is your IAM username, and `123456` is the 6-digit code provided by your MFA device):

```aws sts get-session-token --serial-number arn:aws:iam::123456789012:mfa/USERNAME --token-code 123456```

You'll get a response like this: 

```{
"Credentials": {
    "SecretAccessKey": "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY",
    "SessionToken": "AQoDYXdzEJr...<remainder of security token>",
    "Expiration": "2018-10-11T10:09:50Z",
    "AccessKeyId": "ASIAIOSFODNN7EXAMPLE",
  }
}
```

```sudo vim .aws/credentials```


```
[default]
output = json
region = us-east-1
aws_access_key_id = AKIAIOSFODNN7EXAMPLE
aws_secret_access_key = wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
aws_session_token = AQoDYXdzEJr...<remainder of security token>
```


### Troubleshooting

```An error occurred (AccessDenied) when calling the GetSessionToken operation: Cannot call GetSessionToken with session credentials```

```An error occurred (AccessDenied) when calling the GetSessionToken operation: MultiFactorAuthentication failed, unable to validate MFA code.  Please verify your MFA serial number is valid and associated with this user.````

