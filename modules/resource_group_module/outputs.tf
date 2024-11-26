output "resource_groups_ids_out" {
  value = tomap({
    for r in azurerm_resource_group.rg : r.name => r.id
  })
  description = "Map value with resource groups name as key and the id as value"
}
