terraform {
  backend "s3" {
    bucket = "terraform-jenkins-state-bucket-moni123"
    key = "main"
    dynamodb_table = "my-dynamo-db-table"
  }
}