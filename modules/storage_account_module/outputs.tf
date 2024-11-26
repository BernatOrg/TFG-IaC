output "storage_account_ids_out" {
  value = tomap({
    for sa in azurerm_storage_account.storage : sa.name => sa.id
  })
  description = "Map value with storage accounts name as key and the id as value"
}

output "storage_account_primary_access_keys_out" {
  value = tomap({
    for sa in azurerm_storage_account.storage : sa.name => sa.primary_access_key
  })
  description = "Map value with storage accounts name as key and the primary_access_key as value"
}