/* ------------------------------------------------------------------------------------------------------------ */
/* ------------------------------------- RESOURCE_GROUP_MODULE -------------------------------------------------*/
/* ------------------------------------------------------------------------------------------------------------ */

/* ------------------------------------ azurerm_resource_group  ----------------------------------------------- */
resource_groups_var = [
  {
    location = "northeurope"
    name     = "tfg_BN_RG"
    tags = {
      Project            = "UOC TFG"
      ProjectOwner       = "Bernat Nosas"
      Environment        = "TEST"
      Description        = "Resource Group for final computer science degree project"
      Version            = "1.0.0"
      ManagedByTerraform = "Yes"
    }
  }
]

/* ------------------------------------------------------------------------------------------------------------ */
/* ---------------------------------- STORAGE_ACCOUNT_MODULE  --------------------------------------------------*/
/* ------------------------------------------------------------------------------------------------------------ */

/* ------------------------------------azurerm_storage_account------------------------------------------------- */

storage_accounts_var = [
  /* -------------------infrastructureascode-rg-------------------- */
  {
    access_tier                       = "Cool"
    account_kind                      = "StorageV2"
    account_replication_type          = "GRS"
    account_tier                      = "Standard"
    allowed_copy_scope                = "AAD"
    allow_nested_items_to_be_public   = false
    cross_tenant_replication_enabled  = false
    default_to_oauth_authentication   = false
    enable_https_traffic_only         = true
    infrastructure_encryption_enabled = false
    is_hns_enabled                    = false
    large_file_share_enabled          = false
    location                          = "northeurope"
    min_tls_version                   = "TLS1_2"
    name                              = "tfgiacstorage"
    nfsv3_enabled                     = false
    public_network_access_enabled     = true
    queue_encryption_key_type         = "Service"
    resource_group_name               = "tfg_BN_RG"
    sftp_enabled                      = false
    shared_access_key_enabled         = true
    table_encryption_key_type         = "Service"

    blob_properties = {
      change_feed_enabled           = true
      change_feed_retention_in_days = 90
      last_access_time_enabled      = true
      versioning_enabled            = true
      container_delete_retention_policy = {
        days = 7
      }
      delete_retention_policy = {
        days = 7
      }
    }

    delete_retention_policy = {
      days = 30
    }

    network_rules = {
      bypass         = ["AzureServices"]
      default_action = "Allow"
    }

    tags = {
      Project            = "UOC TFG"
      ProjectOwner       = "Bernat Nosas"
      Environment        = "TEST"
      Description        = "Storage account for final computer science degree project"
      Version            = "1.0.0"
      ManagedByTerraform = "Yes"
    }
  }
]
