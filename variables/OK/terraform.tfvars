/* ------------------------------------------------------------------------------------------------------------ */
/* ------------------------------------- RESOURCE_GROUP_MODULE -------------------------------------------------*/
/* ------------------------------------------------------------------------------------------------------------ */

/* ------------------------------------ azurerm_resource_group  ----------------------------------------------- */
resource_groups_var = [
  {
    name              = "TestTag_RG"
    resource_location = "westeurope"
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
