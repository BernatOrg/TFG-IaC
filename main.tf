module "resource_groups_module" {
  source                    = "./modules/resource_group_module"
  resource_groups_var       = var.resource_groups_var
}