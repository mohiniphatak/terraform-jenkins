# resource "aws_sqs_queue" "terraform_queue_deadletter" {
#   name = "${lower(var.env)}-${lower(var.project_name)}-deadletter-queue-again"
# }

resource "aws_sqs_queue" "terraform_queue" {
  name = "${lower(var.env)}-${lower(var.project_name)}-sqs-queue-for-splunk-again"
  # kms_master_key_id = "" 
  # sqs_managed_sse_enabled = false
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  visibility_timeout_seconds = 300  
  receive_wait_time_seconds = 0
  # redrive_policy = jsonencode({
  #   deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter.arn
  #   maxReceiveCount     = 10
  # })

  tags = {
    Environment = "${lower(var.env)}"
  }
}


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
#           "aws:SourceArn": "${aws_s3_bucket.b.arn}*"
#         }
#       }
#     }
#   ]
# }
# POLICY
# }

