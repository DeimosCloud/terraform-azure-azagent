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

variable "acr_registry" {
  description = "URL of ACR Registry to deploy Container to"
  type        = string
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

variable "sp_id" {
  description = "The ID of the service principal to be assigned as container identities and also used for image pull"
  type        = string
}

variable "sp_secret" {
  description = "Password for Service Principal used for container authentication"
  type        = string
}
