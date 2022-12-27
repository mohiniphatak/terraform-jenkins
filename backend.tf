terraform {
  backend "s3" {
    bucket = "terraform-jenkins-state-bucket-moni123"
    key = "main"
    region = "ap-south-1"
    dynamodb_table = "my-dynamo-db-table"
  }
}