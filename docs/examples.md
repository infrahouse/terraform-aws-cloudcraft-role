# Examples

Common deployment patterns for the `terraform-aws-cloudcraft-role` module.

## Basic Usage

The simplest deployment — create the Cloudcraft role and output the ARN to paste into Cloudcraft.

```hcl
module "cloudcraft" {
  source  = "registry.infrahouse.com/infrahouse/cloudcraft-role/aws"
  version = "0.2.0"

  external_id = "9333c73a-f9e1-4cbb-beb4-39a981e914b6"
}

output "cloudcraft_role_arn" {
  value = module.cloudcraft.cloudcraft-scanner-role-arn
}
```

## Multiple AWS Accounts

If you use Cloudcraft across multiple AWS accounts, deploy the module in each account
with the same external ID.

```hcl
# In each account's Terraform configuration:
module "cloudcraft" {
  source  = "registry.infrahouse.com/infrahouse/cloudcraft-role/aws"
  version = "0.2.0"

  external_id = var.cloudcraft_external_id
}
```

Store the external ID as a variable so it can be shared across account configurations:

```hcl
variable "cloudcraft_external_id" {
  type        = string
  description = "External ID from Cloudcraft for cross-account IAM trust"
  sensitive   = true
}
```

## With AWS Control Tower

When using AWS Control Tower, deploy the module via your account baseline/customization
mechanism (e.g., Account Factory for Terraform) so every new account automatically gets
the Cloudcraft role.

```hcl
module "cloudcraft" {
  source  = "registry.infrahouse.com/infrahouse/cloudcraft-role/aws"
  version = "0.2.0"

  external_id = var.cloudcraft_external_id

  providers = {
    aws = aws.target_account
  }
}
```
