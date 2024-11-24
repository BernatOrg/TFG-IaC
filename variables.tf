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