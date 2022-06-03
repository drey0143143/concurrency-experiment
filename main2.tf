# defines the legacy_finance_cost_management permission set with permissions
module "legacy_finance_cost_management_permissionset" {
  source = "../../..//modules/permissionset"

  permission_set_name        = "legacy_finance_cost_management"
  permission_set_description = "grants legacy permissions to financial information and reporting tools as well granting actionable permissions to implement additional cost controls and cleanup"
  awssso_instance_arn        = var.okta_awsinstance_arn
  managed_policies_to_attach = ["arn:aws:iam::aws:policy/job-function/ViewOnlyAccess"]
  inline_policy_to_attach    = data.aws_iam_policy_document.legacy_finance_cost_management_policy.json
}

# define the inline policy for the legacy_finance_cost_management permission set
data "aws_iam_policy_document" "legacy_finance_cost_management_policy" {
  statement {
    sid = "VisualEditor0"
    actions = [
      "athena:*",
      "aws-portal:*",
      "ce:*",
      "compute-optimizer:*",
      "dynamodb:*",
      "ec2:*",
      "events:*",
      "glue:*",
      "lambda:*",
      "organizations:List*",
      "organizations:Describe*",
      "organizations:UntagResource*",
      "quicksight:*",
      "resource-explorer:*",
      "rds:*",
      "trustedadvisor:*",
    ]
    resources = [
      "*",
    ]
  }
}
