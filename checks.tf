check "storage_account_health_check" {

  data "azurerm_storage_account" "storage_data" {
    name                = "tfgiacstorage"
    resource_group_name = "tfg_BN_RG"
  }

  assert {
    condition     = data.azurerm_storage_account.storage_data.id == "/subscriptions/13594bf7-40a3-4f29-8503-ae1ffe28318c/resourceGroups/tfg_BN_RG/providers/Microsoft.Storage/storageAccounts/tfgiacstorage"
    error_message = "Storage account is not online"
  }
}
