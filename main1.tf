# defines the control_tower_administrator permission set with permissions
module "control_tower_administrator_permissionset" {
  source = "../../..//modules/permissionset"

  permission_set_name        = "control_tower_administrator"
  permission_set_description = "grants access to manage control tower configurations"
  awssso_instance_arn        = var.okta_awsinstance_arn
  inline_policy_to_attach    = data.aws_iam_policy_document.control_tower_administrator_policy.json
}

# define the inline policy for the control_tower_administrator permission set
data "aws_iam_policy_document" "control_tower_administrator_policy" {
  statement {
    sid = "VisualEditor0"
    actions = [
      "controltower:*",
      "organizations:*",
      "servicecatalog:*",
      "config:*",
      "cloudtrail:*",
    ]
    resources = [
      "*",
    ]
  }
}
