terraform {
  backend "s3" {
    bucket = "my-aws-tf-state-bucket"
    key = "main"
    dynamodb_table = "my-dynamo-db-table"
  }
}