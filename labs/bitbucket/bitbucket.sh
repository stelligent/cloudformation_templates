#!/bin/bash

aws cloudformation create-stack --profile <profile name> --stack-name <stack name> --capabilities CAPABILITY_IAM --template-url "https://s3.amazonaws.com/stelligent-public/cloudformation-templates/github/labs/bitbucket/bitbucket.template"  --parameters file:////Users/username/aws/cloudformation_parameters/aws_account/my-lab-bitbucket.json
