variable "resource_groups_ids_var" {
  description = "Map of resource groups name and Id"
  type        = map(string)
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
    network_rules = optional(object({
      bypass         = optional(list(string), [])
      default_action = string
    }), null)
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

  validation {
    condition = alltrue([
      for v in var.storage_accounts_var : v.access_tier == null ? true : (v.access_tier != null && contains(["Hot", "Cool"], v.access_tier))
    ])
    error_message = "The attribute access_tier must contains the following values: Hot or Cool"
  }
  validation {
    condition = alltrue([
      for v in var.storage_accounts_var : contains(["BlobStorage", "BlockBlobStorage", "FileStorage", "Storage", "StorageV2"], v.account_kind)
    ])
    error_message = "The attribute account_kind must contains the following values: BlobStorage, BlockBlobStorage, FileStorage, Storage or StorageV2"
  }
  validation {
    condition = alltrue([
      for v in var.storage_accounts_var : contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], v.account_replication_type)
    ])
    error_message = "The attribute account_replication_type must contains the following values: LRS, GRS, RAGRS, ZRS, GZRS or RAGZRS"
  }
  validation {
    condition = alltrue([
      for v in var.storage_accounts_var : contains(["Standard", "Premium", "FileStorage", "Storage", "StorageV2"], v.account_tier)
    ])
    error_message = "The attribute account_tier must contains the following values: Standard  or Premium"
  }
  validation {
    condition = alltrue([
      for v in var.storage_accounts_var : contains(["TLS1_1", "TLS1_2"], v.min_tls_version)
    ])
    error_message = "The attribute min_tls_version must contains the following values: TLS1_1 or TLS1_2"
  }
  validation {
    condition = alltrue([
      for v in var.storage_accounts_var : contains(["TEST", "PROD", "DEV", "PREPROD"], v.tags.Environment)
    ])
    error_message = "The tag environment must contains the following values: TEST, PROD, DEV or PREPROD"
  }
  validation {
    condition = alltrue([
      for v in var.storage_accounts_var : contains(["Yes", "No"], v.tags.ManagedByTerraform)
    ])
    error_message = "The tag ManagedByTerraform must contains the following values: Yes or No"
  }
  validation {
    condition = alltrue([
      for v in var.storage_accounts_var : can(regex("^(0|[1-9]\\d*)\\.(0|[1-9]\\d*)\\.(0|[1-9]\\d*)(?:-((?:0|[1-9]\\d*|\\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\\.(?:0|[1-9]\\d*|\\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\\+([0-9a-zA-Z-]+(?:\\.[0-9a-zA-Z-]+)*))?$", v.tags.Version))
    ])
    error_message = "The tag Version must be valid semantic version."
  }
}