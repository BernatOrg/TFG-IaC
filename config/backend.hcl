resource_group_name  = "infrastructureascode-rg"
storage_account_name = "tfgiacstorage"
container_name       = "uoc-tfg-state"
key                  = "terraform_tfg.tfstate"
use_oidc             = true
subscription_id      = "__BACKEND_SUBSCRIPTION__"