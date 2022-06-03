# defines the finance_operations permission set with permissions
module "finance_operations_permissionset" {
  source = "../../..//modules/permissionset"

  permission_set_name        = "finance_operations"
  permission_set_description = "grants access to financial information and reporting tools for individuals who manage account/organizational spend"
  awssso_instance_arn        = var.okta_awsinstance_arn
  managed_policies_to_attach = ["arn:aws:iam::aws:policy/job-function/Billing"]
  inline_policy_to_attach    = data.aws_iam_policy_document.finance_operations_policy.json
}

# define the inline policy for the finance_operations permission set
data "aws_iam_policy_document" "finance_operations_policy" {
  statement {
    sid = "VisualEditor0"
    actions = [
      "compute-optimizer:*",
      "events:*",
      "organizations:List*",
      "organizations:Describe*",
      "organizations:UntagResource",
      "quicksight:*",
      "savingsplans:*",
      "resource-explorer:*",
      "trustedadvisor:*",
    ]
    resources = [
      "*",
    ]
  }
}
