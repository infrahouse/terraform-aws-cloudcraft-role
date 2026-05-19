# Getting Started

This guide walks you through deploying the Cloudcraft IAM role in your AWS account.

## Prerequisites

### AWS

- An AWS account where you want Cloudcraft to scan infrastructure
- Terraform >= 1.0 installed
- AWS provider >= 5.20 configured

### Cloudcraft

- A Cloudcraft account (free or paid)
- The **External ID** from your Cloudcraft account settings

## Finding Your External ID

1. Log in to [Cloudcraft](https://app.cloudcraft.co/)
2. Go to **AWS Account** > **Add AWS account**
3. Copy the **External ID** (a UUID like `9333c73a-f9e1-4cbb-beb4-39a981e914b6`)

## Deploying the Module

### Step 1: Add the Module

```hcl
module "cloudcraft" {
  source  = "registry.infrahouse.com/infrahouse/cloudcraft-role/aws"
  version = "0.2.0"

  external_id = "your-external-id-from-cloudcraft"
}

output "cloudcraft_role_arn" {
  value = module.cloudcraft.cloudcraft-scanner-role-arn
}
```

### Step 2: Apply

```bash
terraform init
terraform plan
terraform apply
```

### Step 3: Connect Cloudcraft

1. Copy the role ARN from the Terraform output
2. In Cloudcraft, go to **AWS Account** > **Add AWS account**
3. Paste the role ARN
4. Click **Save**

Cloudcraft will now scan your AWS infrastructure and you can start creating architecture diagrams.

## Verifying the Setup

After connecting, Cloudcraft should be able to:

- Discover your AWS resources across all supported services
- Generate live architecture diagrams
- Show resource metadata (instance types, sizes, etc.)

If Cloudcraft reports permission errors, see the [Troubleshooting](troubleshooting.md) guide.
