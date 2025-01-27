# terraform-aws-cloudcraft-role

Use this module to create an IAM role for CloudCraft.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.20 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.20 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.cloudcraft_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.cloudcraft-scanner](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cloudcraft_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cloudcraft_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudcraft-scanner-role-arn"></a> [cloudcraft-scanner-role-arn](#output\_cloudcraft-scanner-role-arn) | Created role ARN. This role to be passed to CloudCraft. |
| <a name="output_cloudcraft-scanner-role-name"></a> [cloudcraft-scanner-role-name](#output\_cloudcraft-scanner-role-name) | Created role ARN. |
