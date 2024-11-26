resource "azurerm_storage_account" "storage" {
  for_each = { for each in var.storage_accounts_var : each.name => each }

  access_tier                       = each.value.access_tier
  account_kind                      = each.value.account_kind
  account_replication_type          = each.value.account_replication_type
  account_tier                      = each.value.account_tier
  allow_nested_items_to_be_public   = each.value.allow_nested_items_to_be_public
  allowed_copy_scope                = each.value.allowed_copy_scope
  cross_tenant_replication_enabled  = each.value.cross_tenant_replication_enabled
  default_to_oauth_authentication   = each.value.default_to_oauth_authentication
  infrastructure_encryption_enabled = each.value.infrastructure_encryption_enabled
  is_hns_enabled                    = each.value.is_hns_enabled
  large_file_share_enabled          = each.value.large_file_share_enabled
  location                          = each.value.location
  min_tls_version                   = each.value.min_tls_version
  name                              = each.value.name
  nfsv3_enabled                     = each.value.nfsv3_enabled
  public_network_access_enabled     = each.value.public_network_access_enabled
  queue_encryption_key_type         = each.value.queue_encryption_key_type
  resource_group_name               = each.value.resource_group_name
  sftp_enabled                      = each.value.sftp_enabled
  shared_access_key_enabled         = each.value.shared_access_key_enabled
  table_encryption_key_type         = each.value.table_encryption_key_type
  tags                              = each.value.tags

  blob_properties {

    change_feed_enabled           = each.value.blob_properties.change_feed_enabled
    change_feed_retention_in_days = each.value.blob_properties.change_feed_retention_in_days
    last_access_time_enabled      = each.value.blob_properties.last_access_time_enabled
    versioning_enabled            = each.value.blob_properties.versioning_enabled

    dynamic "container_delete_retention_policy" {
      for_each = try(each.value.blob_properties.container_delete_retention_policy, null) != null ? [1] : []
      content {
        days = each.value.blob_properties.container_delete_retention_policy.days
      }
    }

    dynamic "delete_retention_policy" {
      for_each = try(each.value.blob_properties.delete_retention_policy, null) != null ? [1] : []
      content {
        days = each.value.blob_properties.delete_retention_policy.days
      }
    }

  }
  network_rules {

    bypass         = each.value.network_rules.bypass
    default_action = each.value.network_rules.default_action
  }

}