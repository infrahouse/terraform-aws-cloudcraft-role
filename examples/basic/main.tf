module "cloudcraft" {
  source  = "registry.infrahouse.com/infrahouse/cloudcraft-role/aws"
  version = "0.2.0"

  external_id = var.cloudcraft_external_id
}
