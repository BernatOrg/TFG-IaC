variable "resource_groups_var" {
  description = "List of resource groups to be created"
  type = list(object({
    location          = string
    managed_by        = optional(string, null)
    name              = string
    resource_location = optional(string, null)
    tags = object({
      Project            = string
      ProjectOwner       = string
      Environment        = string
      Description        = optional(string, "")
      Version            = optional(string, "1.0.0")
      ManagedByTerraform = string
    })
  }))
  default = []
}

variable "storage_accounts_var" {
  description = "list of Storage Accounts"
  type = list(object({
    access_tier                       = optional(string, null)
    account_kind                      = optional(string, "StorageV2")
    account_replication_type          = optional(string, "LRS")
    account_tier                      = optional(string, "Standard")
    allow_nested_items_to_be_public   = optional(bool, false)
    allowed_copy_scope                = optional(string, null)
    cross_tenant_replication_enabled  = optional(bool, null)
    default_to_oauth_authentication   = optional(bool, false)
    infrastructure_encryption_enabled = optional(bool, false)
    is_hns_enabled                    = optional(bool, false)
    large_file_share_enabled          = optional(bool, false)
    location                          = string
    min_tls_version                   = optional(string, "TLS1_2")
    name                              = string
    nfsv3_enabled                     = optional(bool, false)
    public_network_access_enabled     = optional(bool, true)
    queue_encryption_key_type         = optional(string, "Service")
    resource_group_name               = string
    resource_location                 = optional(string, null)
    sftp_enabled                      = optional(bool, false)
    shared_access_key_enabled         = optional(bool, true)
    table_encryption_key_type         = optional(string, "Service")
    blob_properties = object({
      change_feed_enabled           = optional(bool, false)
      change_feed_retention_in_days = optional(number, null)
      last_access_time_enabled      = optional(bool, false)
      versioning_enabled            = optional(bool, false)

      container_delete_retention_policy = optional(object({
        days = optional(number, 1)
      }), null)

      delete_retention_policy = optional(object({
        days = optional(number, 1)
      }), null)
    })
    network_rules = object({
      bypass         = optional(list(string), [])
      default_action = string
    })
    tags = object({
      Project            = string
      ProjectOwner       = string
      Environment        = string
      Description        = optional(string, "")
      Version            = optional(string, "1.0.0")
      ManagedByTerraform = optional(string, "No")
    })
  }))
  default = []
}