

# variable "stage_name" {
#   type = string
# }

variable "env" {
  type = string
}


variable "project_name" {
    type = string
    description = "Project Name"
    default	= "JenkinsTerraform"
}

# variable "sqs_name" {
#         description = "Name of the sqs queue to be created. You can assign any unique name for the Queue"
#         default = "my-first-sqs"
# }


# variable "s3_bucket_name" {
#     type = string
# }
