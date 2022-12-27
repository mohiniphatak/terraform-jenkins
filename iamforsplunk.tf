# resource "aws_iam_role" "test_role_through_terraform" {
#   name = "test_role_through_terraform"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Sid    = ""
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       },
#     ]
#   })

#   tags = {
#     tag-key = "tag-value"
#   }
# }

# resource "aws_iam_policy" "policy" {
#   name        = "test-policy-through-terraform-jenkins"
#   description = "A test policy"
#   policy      = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#         {
#             Effect = "Allow"
#             Action = "s3:*"
#             Resource = "*"
#         }
#     ]
#   })
# }

# resource "aws_iam_policy_attachment" "test-attach" {
#   name       = "test-attachment-through-terraform"
#   roles      = ["${aws_iam_role.test_role_through_terraform.name}"]
#   policy_arn = "${aws_iam_policy.policy.arn}"
# }