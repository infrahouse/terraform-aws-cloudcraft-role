# Configuration Reference

This page documents all available configuration options.

## Variables

### `external_id`

| Property | Value |
|----------|-------|
| **Type** | `string` |
| **Required** | Yes |
| **Default** | — |

The external ID value provided by Cloudcraft. This is a UUID that Cloudcraft generates for your account
and uses when assuming the IAM role. You can find it in your Cloudcraft account settings under
**AWS Account** > **Add AWS account**.

**Example:**

```hcl
module "cloudcraft" {
  source  = "registry.infrahouse.com/infrahouse/cloudcraft-role/aws"
  version = "0.2.0"

  external_id = "9333c73a-f9e1-4cbb-beb4-39a981e914b6"
}
```

## Outputs

### `cloudcraft-scanner-role-arn`

The ARN of the created IAM role. Pass this value to Cloudcraft when connecting your AWS account.

### `cloudcraft-scanner-role-name`

The name of the created IAM role (`cloudcraft-scanner`).

## Provider Requirements

| Provider | Version |
|----------|---------|
| `aws` | `>= 5.20` |
