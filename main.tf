module "resource_groups_module" {
  source              = "./modules/resource_group_module"
  resource_groups_var = var.resource_groups_var
}

module "storage_accounts_module" {
  source                  = "./modules/storage_account_module"
  resource_groups_ids_var = module.resource_groups_module.resource_groups_ids_out
  storage_accounts_var    = var.storage_accounts_var
}