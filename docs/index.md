# InfraHouse Cloudcraft Role

This Terraform module creates an IAM role that allows [Cloudcraft](https://www.cloudcraft.co/) to scan
your AWS infrastructure for visualization and diagramming.

## Why This Module?

Setting up Cloudcraft's AWS integration requires creating an IAM role with a broad set of read-only
permissions across dozens of AWS services. Doing this manually is tedious and error-prone. This module:

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

Then paste the role ARN into your Cloudcraft account settings under
**AWS Account** > **Add AWS account**.

## Supported AWS Services

The module grants read-only access to the following AWS services:

| Category | Services |
|----------|----------|
| **Compute** | EC2, ECS, EKS, Lambda, Auto Scaling |
| **Storage** | S3, EFS, FSx, Glacier |
| **Database** | RDS, DynamoDB, ElastiCache, Redshift, Timestream, Cassandra (Keyspaces) |
| **Networking** | VPC, Route 53, CloudFront, ELB/ALB, Direct Connect, Transit Gateway, WAFv2 |
| **Messaging** | SNS, SQS, EventBridge, Kinesis |
| **Search** | Elasticsearch/OpenSearch |
| **API** | API Gateway |
| **Container Registry** | ECR, ECR Public |
