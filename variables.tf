variable "resource_group_name" {
  description = "The name of the resource group in which to create the Container Registry. Changing this forces a new resource to be created."
  type        = string
}

variable "prefix" {
  description = "The prefix for all created resources"
  type        = string
  default     = "linux-agent"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "registry_url" {
  description = "URL of Registry to deploy Container to"
  type        = string
  default     = null
}

variable "azp_token" {
  description = "Azure DevOps Token"
  type        = string
}

variable "azp_url" {
  description = "The URL of the Azure DevOps or Azure DevOps Server instance"
  type        = string
}

variable "azp_pool_name" {
  description = "The URL of the Azure DevOps or Azure DevOps Server instance"
  type        = string
  default     = "Default"
}

variable "cpu" {
  description = "The required number of CPU cores of the containers. Changing this forces a new resource to be created."
  default     = "0.5"
  type        = string
}

variable "memory" {
  description = "The required memory of the containers in GB. Changing this forces a new resource to be created."
  default     = "1.5"
  type        = string
}

variable "registry_username" {
  description = "The username used to authenticate to registry. Could be service principal ID"
  type        = string
  default     = null
}

variable "registry_secret" {
  description = "Password for user to be used for container authentication"
  type        = string
  default     = null
}
