resource "azurerm_resource_group" "rg" {
  for_each = { for each in var.resource_groups_var : each.name => each }

  managed_by = each.value.managed_by
  name       = each.value.name
  location   = each.value.location
  tags       = each.value.tags

}