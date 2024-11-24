variable "resource_groups_var" {
  description = "List of resource groups to be creted"
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

  validation {
    condition = alltrue([
      for v in var.resource_groups_var : contains(["Yes", "No"], v.tags.ManagedByTerraform)
    ])
    error_message = "The tag ManagedByTerraform must contains the following values: Yes or No"
  }
  validation {
    condition = alltrue([
      for v in var.resource_groups_var : can(regex("^(0|[1-9]\\d*)\\.(0|[1-9]\\d*)\\.(0|[1-9]\\d*)(?:-((?:0|[1-9]\\d*|\\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\\.(?:0|[1-9]\\d*|\\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\\+([0-9a-zA-Z-]+(?:\\.[0-9a-zA-Z-]+)*))?$", v.tags.Version))
    ])
    error_message = "The tag Version must be valid semantic version."
  }
}