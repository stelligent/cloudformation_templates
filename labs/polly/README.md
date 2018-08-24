# AWS Polly
## Introduction

Using Amazon Polly to create an audio version of a blog post.

1. Manually create an Amazon S3 bucket
1. Manually create an Amazon Text-to-Speech MP3 and synthesize to Amazon S3
1. Make the MP3 public
1. Create an HTML audio tag snippet and embed in the blog post (HTML/Wordpress)
1. Create a custom CloudFormation resource
1. The Lambda in the custom CloudFormation resource will using the AWS CLI to create MP3 using Amazon Polly
1. Create a CloudFormation template that creates the S3 bucket, uses the Amazon Polly custom resource, and a CodePipeline that uses Polly every time some text is changed. 

New Idea: Use CodeBuild to do the same thing using the AWS CLI?

Question: How to automatically upload text from Wordpress changes to S3 or a version control repo?

https://stelligent.com/feed/

https://stelligent.com/?s=AWS%20Budget%20Notifications%20in%20CloudFormation&feed=rss2

Here's an example of the code snippet...

```  TotalMonthlyBudget:
    Type: "AWS::Budgets::Budget"
    Properties:
      Budget:
        BudgetLimit:
          Amount: !Sub ${BudgetLimit}
          Unit: !Sub ${Currency}
        TimeUnit: MONTHLY
        TimePeriod:
          Start: !Sub ${StartTime}
          End: !Sub ${EndTime}
        BudgetType: COST
      NotificationsWithSubscribers:
        - Notification:
            NotificationType: ACTUAL
            ComparisonOperator: GREATER_THAN
            Threshold: !Sub ${Threshold02}
          Subscribers:
          - SubscriptionType: EMAIL
            Address: !Sub ${EMail01}
          - SubscriptionType: SNS
            Address: !Sub ${NotifyPhonesSNS}
        - Notification:
            NotificationType: ACTUAL
            ComparisonOperator: GREATER_THAN
            Threshold: !Sub ${Threshold01}
          Subscribers:
          - SubscriptionType: EMAIL
            Address: !Sub ${EMail01}
          - SubscriptionType: SNS
            Address: !Sub ${NotifyPhonesSNS}
```

## Architecture and Implementation
###  Architecture Diagram
![budgets-arch](docs/budgets-arch.png)

## CloudFormation Templates resources
  - **AWS Budget** – [AWS::Budgets::Budget](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-budgets-budget.html) – TBD

## Costs
This section outlines cost considerations for provisioning AWS Budgets Notifications. 
- **CloudFormation** – No Additional Cost

## Deployment Steps
####  Step 1. Prepare an AWS Account
Create or login AWS account at [http://aws.amazon.com](http://aws.amazon.com) by following the instructions on the site.

####  Step 2. Launch the Stack
Click on the **Launch Stack** button below to launch the CloudFormation Stack to set up your AWS Budgets. 

**Stack Assumptions:** The pipeline stack assumes the following conditions, and may not function properly if they are not met:
1. The pipeline stack name is less than 20 characters long
2. The stack is launched in the US East (N. Virginia) Region (`us-east-1`).

*NOTE: The URL for Launch Stack is automatically generated through a pipeline in one of Stelligent's AWS accounts.*

[![Launch CFN stack](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png)](https://console.aws.amazon.com/cloudformation/home?region=us-east-1#cstack=sn~sagemaker-stack|turl~https://s3.amazonaws.com/sagemaker-pipeline-src/CodePipeline/pipeline.yaml)

You can launch the same stack using the AWS CLI. Here's an example:

`aws cloudformation create-stack --stack-name YOURSTACKNAME --template-body file:///home/ec2-user/environment/tools/budget-notifications.yml --parameters ParameterKey=EMail01,ParameterValue=YOUREMAIL@example.com ParameterKey=PhoneNumber01,ParameterValue=12125551212 ParameterKey=BudgetLimit,ParameterValue=1000 ParameterKey=Threshold01,ParameterValue=65 --capabilities CAPABILITY_NAMED_IAM`

## Parameters
Parameters | Description
---------- | -----------
Currency | Country currency. Default is `USD`.
StartTime | Start Time for the first day in which AWS Budgets is reporting on cost usage.
EndTime | End Time for the last day in which AWS Budgets is reporting on cost usage.
BudgetLimit | Numeric form of budget limit for the evaluated time period. Default is: `1000`. 
SageMakerBudgetLimit | Numeric form of budget limit for a specifc service (`Amazon SageMaker` in this case) for the evaluated time period.
Threshold01 | Number between 0 and 100 representing the percentage of the `BudgetLimit` in which people get notified
Threshold02 | Number between 0 and 100 representing the next percentage of the `BudgetLimit` in which people get notified
EMail01 | Email address for which budget notifications are sent. Example is `example@example.com`.
PhoneNumber01 | Phone number for which budget notifications are sent via SMS. Format is `12125551212`. Number must be preceded by the country code (e.g. USA is `1`)

####  Step 3. Test the Deployment
Go to the [AWS Budgets dashboard](https://console.aws.amazon.com/billing/home?#/budgets) and verify the budgets have been created correctly.

#  Filtering Budgets 
You can filter your budgets by all types of criteria. The most effective way I found to automate this was to edit an existing budget to get the data. There's probably a way to do it through the API but it wasn't obvious to me. 


## Filtering by Service

Go back to the [AWS Budgets dashboard](https://console.aws.amazon.com/billing/home?#/budgets) and *select the checkbox* next to the budget you'd like to modify and click **Edit**. For example, to filter on a specific service, select the **Service** checkbox in the *Refine your budget* section. Choose the Service or Services you'd like to filter. For example, if you want to filter on `Amazon SageMaker`, choose this from the Service selection. Once you've done, save the budget. To automate it in CloudFormation, you'll need to run the following command from the command line and put the relevant results in your CloudFormation template. 


`aws budgets describe-budgets --account-id <ACCOUNTID>`

The results look like this: 

```
            "CostFilters": {
                "Service": [
                    "Amazon SageMaker"
                ]
            }
```

And this translates to the following in CloudFormation YAML. `CostFilters` is a Property of `AWS::Budgets::Budget`:
```
        CostFilters:
          Service:
          - Amazon SageMaker
```


##  Filtering by Linked Accounts

You can go through the same process for filtering on AWS accounts. 

The results returned when running `aws budgets describe-budgets --account-id <ACCOUNTID>` look like this (Your account ids should be something other than `123456789012`:


```
            "CostFilters": {
                "LinkedAccount": [
                    "123456789012", 
                    "123456789012"
                ]
            }
```

The account id values can be defined in the comma-delimited parameter name: `LinkedAccountNumbers`.

# Additional Resources
* [AWS::Budgets::Budget](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-budgets-budget.html)
* [AWS Budgets](https://aws.amazon.com/aws-cost-management/aws-budgets/)

## Summary
You learned how to use the AWS Budgets feature and automate its provisioning.