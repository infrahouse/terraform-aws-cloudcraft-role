output "cloudcraft_role_arn" {
  description = "The ARN of the Cloudcraft scanner IAM role"
  value       = module.cloudcraft.cloudcraft-scanner-role-arn
}
