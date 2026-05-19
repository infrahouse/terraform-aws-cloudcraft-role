# Troubleshooting

Common issues and their solutions.

## Cloudcraft Cannot Discover Resources

### Symptoms

- Cloudcraft shows "No resources found" after connecting
- Some services appear but others are missing

### Check 1: Verify the Role ARN

Ensure you copied the correct role ARN from the Terraform output:

```bash
terraform output cloudcraft_role_arn
```

Paste this exact value into Cloudcraft.

### Check 2: Verify the External ID

The external ID must match exactly what Cloudcraft provides. Check your Terraform configuration:

```bash
terraform state show module.cloudcraft.aws_iam_role.cloudcraft-scanner
```

### Check 3: Test the Role Manually

Use the AWS CLI to verify the role can be assumed:

```bash
aws sts assume-role \
  --role-arn "$(terraform output -raw cloudcraft_role_arn)" \
  --role-session-name test \
  --external-id "your-external-id"
```

If this fails, the trust policy or external ID is misconfigured.

## Permission Denied Errors

### Symptoms

- Cloudcraft reports "Access Denied" for specific services
- Partial infrastructure discovery

### Possible Causes

1. **AWS Organizations SCP** — A Service Control Policy may be blocking read access.
   Check your organization's SCPs.
2. **Region restrictions** — Some resources may exist in regions where the role
   doesn't have access due to SCPs or region deny policies.

## Terraform Apply Errors

### "Invalid external ID format"

The external ID must be a valid UUID. Verify the value in your Cloudcraft account settings.

### "Role already exists"

If the `cloudcraft-scanner` role already exists (e.g., from a manual setup), either:

1. Import the existing role: `terraform import module.cloudcraft.aws_iam_role.cloudcraft-scanner cloudcraft-scanner`
2. Delete the existing role manually and re-apply

## Still Need Help?

- Open an issue on [GitHub](https://github.com/infrahouse/terraform-aws-cloudcraft-role/issues)
- [Contact InfraHouse](https://infrahouse.com/contact)
