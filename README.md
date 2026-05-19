# terraform-aws-cloudcraft-role

[![Need Help?](https://img.shields.io/badge/Need%20Help%3F-Contact%20Us-0066CC)](https://infrahouse.com/contact)
[![Docs](https://img.shields.io/badge/docs-github.io-blue)](https://infrahouse.github.io/terraform-aws-cloudcraft-role/)
[![Registry](https://img.shields.io/badge/Terraform-Registry-purple?logo=terraform)](https://registry.terraform.io/modules/infrahouse/cloudcraft-role/aws/latest)
[![Release](https://img.shields.io/github/release/infrahouse/terraform-aws-cloudcraft-role.svg)](https://github.com/infrahouse/terraform-aws-cloudcraft-role/releases/latest)
[![AWS IAM](https://img.shields.io/badge/AWS-IAM-orange?logo=amazoniam)](https://aws.amazon.com/iam/)
[![Security](https://img.shields.io/github/actions/workflow/status/infrahouse/terraform-aws-cloudcraft-role/vuln-scanner-pr.yml?label=Security)](https://github.com/infrahouse/terraform-aws-cloudcraft-role/actions/workflows/vuln-scanner-pr.yml)
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)

This Terraform module creates an IAM role that allows [Cloudcraft](https://www.cloudcraft.co/) to scan your
AWS infrastructure for visualization and diagramming. The role grants read-only permissions across many AWS
services and uses an external ID condition for secure cross-account trust with Cloudcraft's AWS account.

## Why This Module?

Setting up Cloudcraft's AWS integration requires creating an IAM role with a broad set of read-only permissions
across dozens of AWS services. Doing this manually is tedious and error-prone. This module:

- **Codifies the exact permissions** Cloudcraft needs — no guessing which actions to allow
- **Enforces external ID validation** for secure cross-account access
- **Keeps permissions auditable** — review changes in version control instead of the AWS console
- **Stays up to date** — new Cloudcraft-required permissions are added as the product evolves

## Features

- Cross-account IAM role with external ID condition for Cloudcraft's account (`968898580625`)
- Read-only permissions across 30+ AWS services (EC2, RDS, S3, ECS, Lambda, EKS, and more)
- Least-privilege policy scoped to describe/list/get actions only
- Simple single-variable configuration (just the external ID from Cloudcraft)

## Quick Start

```hcl
module "cloudcraft" {
  source  = "registry.infrahouse.com/infrahouse/cloudcraft-role/aws"
  version = "0.2.0"

  external_id = "9333c73a-f9e1-4cbb-beb4-39a981e914b6"  # From your Cloudcraft account
}

output "cloudcraft_role_arn" {
  value = module.cloudcraft.cloudcraft-scanner-role-arn
}
```

Then paste the role ARN into your Cloudcraft account settings under **AWS Account** > **Add AWS account**.

## Documentation

Full documentation is available at
[infrahouse.github.io/terraform-aws-cloudcraft-role](https://infrahouse.github.io/terraform-aws-cloudcraft-role/).

- [Getting Started](https://infrahouse.github.io/terraform-aws-cloudcraft-role/getting-started/) — Prerequisites and first deployment
- [Architecture](https://infrahouse.github.io/terraform-aws-cloudcraft-role/architecture/) — How the module works
- [Configuration](https://infrahouse.github.io/terraform-aws-cloudcraft-role/configuration/) — Variable reference
- [Examples](https://infrahouse.github.io/terraform-aws-cloudcraft-role/examples/) — Common use cases
- [Troubleshooting](https://infrahouse.github.io/terraform-aws-cloudcraft-role/troubleshooting/) — Common issues and solutions

## Usage

<!-- BEGIN_TF_DOCS -->

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

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_external_id"></a> [external\_id](#input\_external\_id) | External ID value that cloudcraft provides. Format is 9333c73a-f9e1-4cbb-beb4-39a981e914b6 | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudcraft-scanner-role-arn"></a> [cloudcraft-scanner-role-arn](#output\_cloudcraft-scanner-role-arn) | Created role ARN. This role to be passed to CloudCraft. |
| <a name="output_cloudcraft-scanner-role-name"></a> [cloudcraft-scanner-role-name](#output\_cloudcraft-scanner-role-name) | Created role ARN. |
<!-- END_TF_DOCS -->

## Examples

See the [`examples/`](examples/) directory for complete working examples.

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

This project is licensed under the Apache 2.0 License — see the [LICENSE](LICENSE) file for details.
