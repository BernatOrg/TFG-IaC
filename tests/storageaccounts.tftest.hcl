run "azurerm_storage_account_unit_tests" {

  command = plan

  assert {
    condition = alltrue([
      for v in var.storage_accounts_var : v.is_hns_enabled == false ? true : v.is_hns_enabled == true && (v.account_tier == "Standard" || (v.account_tier == "Premium" && v.account_kind == "BlockBlobStorage"))
    ])
    error_message = "This can only be true when account_tier is Standard or when account_tier is Premium and account_kind is BlockBlobStorage. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#is_hns_enabled"
  }

  assert {
    condition = alltrue([
      for v in var.storage_accounts_var : v.nfsv3_enabled == false ? true : v.nfsv3_enabled == true && ((v.account_tier == "Standard" && v.account_kind == "StorageV2") || (v.account_tier == "Premium" && v.account_kind == "BlockBlobStorage"))
    ])
    error_message = "This can only be true when account_tier is Standard and account_kind is StorageV2, or account_tier is Premium and account_kind is BlockBlobStorage. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#nfsv3_enabled"
  }

  assert {
    condition = alltrue([
      for v in var.storage_accounts_var : v.nfsv3_enabled == false ? true : v.nfsv3_enabled == true && v.is_hns_enabled == true
    ])
    error_message = "Additionally, the is_hns_enabled is true. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#nfsv3_enabled"
  }

  assert {
    condition = alltrue([
      for v in var.storage_accounts_var : v.nfsv3_enabled == false ? true : v.nfsv3_enabled == true && contains(["LRS", "RAGRS"], v.account_replication_type)
    ])
    error_message = "Additionally, the is_hns_enabled is true and account_replication_type must be LRS or RAGRS. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#nfsv3_enabled"
  }

  assert {
    condition = alltrue([
      for v in var.storage_accounts_var : v.sftp_enabled == false ? true : v.sftp_enabled == true && v.is_hns_enabled == true
    ])
    error_message = "SFTP support requires is_hns_enabled set to true. https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#sftp_enabled"
  }

}