#!/bin/bash

# aws s3 cp s3://delete-pmd-guardduty/text-for-polly/text-for-polly.txt text-for-polly.txt
# testvar=$(cat /home/ec2-user/environment/cloudformation_templates/labs/polly/blog.txt)

testvar=$(cat /home/ec2-user/environment/cloudformation_templates/labs/polly/blog.txt)

# testvar="Here is my test of Polly"

echo $testvar

# aws polly synthesize-speech --output-format mp3 --voice-id Brian --text "$testvar" polly3.mp3
aws polly start-speech-synthesis-task --output-format mp3 --output-s3-bucket-name delete-pmd-guardduty --text "$testvar" --voice-id Brian 
# aws s3 cp polly4.mp3 s3://delete-pmd-guardduty/polly4.mp3

# aws polly start-speech-synthesis-task --output-format mp3 --voice-id Joanna --output-s3-bucket-name delete-pmd-guardduty --text ./labs/polly/blog.txt hello.mp3