# # Terraform Settings Block
# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       #version = "~> 3.21" # Optional but recommended in production
#     }
#   }
# }



# # Provider Block
# provider "aws" {
#   profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
#   region  = "ap-south-1"
# }



# # Resource Block
# resource "aws_instance" "ec2demotest" {
#   ami           = "ami-06489866022e12a14" # Amazon Linux in us-east-1, update as per your region
#   instance_type = "t2.micro"
# }




# resource "aws_s3_bucket_notification" "bucket_notification" {
#   bucket = aws_s3_bucket.s3-sink.id

#   queue {
#     queue_arn     = aws_sqs_queue.terraform_queue.arn
#     events        = ["s3:ObjectCreated:*"]
#   }
# }


# resource "aws_s3_bucket_notification" "bucket_notification" {
#   bucket = aws_s3_bucket.b.id

#   queue {
#     queue_arn     = aws_sqs_queue.terraform_queue.arn
#     events        = ["s3:ObjectCreated:*"]
#     # filter_suffix = ".log"
#   }
# }

# resource "aws_sqs_queue" "terraform_queue_deadletter" {
#   name = "deadletter-queue"
# }

# resource "aws_sqs_queue" "terraform_queue" {
#   name                      = "sqs-queue-for-splunk"
#   # sqs_managed_sse_enabled = false
#   delay_seconds             = 0
#   max_message_size          = 262144
#   message_retention_seconds = 345600
#   visibility_timeout_seconds = 300  
#   receive_wait_time_seconds = 0
#   redrive_policy = jsonencode({
#     deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter.arn
#     maxReceiveCount     = 10
#   })

#   tags = {
#     Environment = "dev"
#   }
# }


# resource "aws_sqs_queue_policy" "my_sqs_policy" {
#   queue_url = aws_sqs_queue.terraform_queue.id

#   policy = <<POLICY
#   {
#   "Version": "2008-10-17",
#   "Statement": [
#     {
#       "Sid": "",
#       "Effect": "Allow",
#       "Principal": {
#         "AWS": "*"
#       },
#       "Action": "SQS:SendMessage",
#       "Resource": "${aws_sqs_queue.terraform_queue.arn}",
#       "Condition": {
#         "ArnLike": {
#           "aws:SourceArn": "${aws_s3_bucket.s3-sink.arn}*"
#         }
#       }
#     }
#   ]
# }
# POLICY
# }

