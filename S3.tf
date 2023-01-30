resource "aws_s3_bucket" "s3-sink" {
 bucket = "bucket-created-jenkins-terraform"
}

resource "aws_s3_bucket" "s3-buck" {
 bucket = "bucket-created-jenkins-terraform-again-again"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.s3-sink.id

  queue {
    queue_arn     = aws_sqs_queue.terraform_queue.arn
    events        = ["s3:ObjectCreated:*"]
  }
}



resource "aws_s3_bucket_public_access_block" "access" {
  bucket = aws_s3_bucket.s3-sink.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}