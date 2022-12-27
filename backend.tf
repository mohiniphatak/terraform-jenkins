terraform {
  backend "s3" {
    bucket = "terraform-jenkins-state-bucket-moni123"
    key = "main"
    region = "us-east-1"
    dynamodb_table = "my-dynamo-db-table"
  }
}