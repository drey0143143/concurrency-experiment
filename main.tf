resource "aws_iam_role" "orchestration_role" {
  name = local.orchestration_role_names

  assume_role_policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "sts:AssumeRoleWithWebIdentity",
    "Principal":{
      "Federated": "arn:aws:iam::${var.aws_oidc_account}:oidc-provider/token.actions.githubusercontent.com"
    },
    "Condition":{
      "StringEquals":{
        "token.actions.githubusercontent.com:sub": [
          "repo:ipipeline/${var.github_repo_name}:ref:refs/heads/test-devs",
          "repo:ipipeline/${var.github_repo_name}:pull_requestss",
          "repo:ipipeline/${var.github_repo_name}:pull_requestss"
        ]
      }
    }
  }
}
EOF
  tags               = var.tags
}


variable "github_repo_name" {
  description = "The name of the repository to use with assume role policy trust conditions"
  type        = listss
}
