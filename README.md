# Terraform Azure AzAgent Module

Self Hosted Agent for running Pipelines on Azure## Requirements

## Usage

```hcl
module "self_hosted_agent" {
  source              = "../modules/linux_agent"
  prefix              = "MyProject"
  resource_group_name = azurerm_resource_group.resource_group.name
  registry_username   = var.registry_username
  registry_secret     = var.registry_password
  azp_url             = "https://dev.azure.com/${var.org_name}"
  azp_token           = var.admin_private_access_token
  azp_pool_name       = "My Pool"
  registry_url        = var.acr_registry_url
}
```
The User whose token is to be used must have Agent Pool Manage and Read Permissions (https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/v2-linux?view=azure-devops#confirm-the-user-has-permission)

## Contributing

Report issues/questions/feature requests on in the issues section.

Full contributing guidelines are covered [here](CONTRIBUTING.md).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | >= 0.1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.37.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | 0.1.8 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.94.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.1.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuredevops_agent_pool.pool](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/agent_pool) | resource |
| [azurerm_container_group.cg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_group) | resource |
| [null_resource.deploy_container](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_id.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [azurerm_resource_group.cg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azp_pool_name"></a> [azp\_pool\_name](#input\_azp\_pool\_name) | The URL of the Azure DevOps or Azure DevOps Server instance | `string` | `"Default"` | no |
| <a name="input_azp_token"></a> [azp\_token](#input\_azp\_token) | Azure DevOps Token | `string` | n/a | yes |
| <a name="input_azp_url"></a> [azp\_url](#input\_azp\_url) | The URL of the Azure DevOps or Azure DevOps Server instance | `string` | n/a | yes |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | The required number of CPU cores of the containers. Changing this forces a new resource to be created. | `string` | `"0.5"` | no |
| <a name="input_create_image"></a> [create\_image](#input\_create\_image) | Whether to create the image and push to registry. If image already exists no need to push | `bool` | `false` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | Name of docker image to create or pull from for the agent | `string` | `"dockeragent"` | no |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | Image Tag | `string` | `"latest"` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | The required memory of the containers in GB. Changing this forces a new resource to be created. | `string` | `"1.5"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix for all created resources | `string` | `"linux-agent"` | no |
| <a name="input_registry_secret"></a> [registry\_secret](#input\_registry\_secret) | Password for user to be used for container authentication | `string` | `null` | no |
| <a name="input_registry_url"></a> [registry\_url](#input\_registry\_url) | URL of Registry to deploy Container to | `string` | `null` | no |
| <a name="input_registry_username"></a> [registry\_username](#input\_registry\_username) | The username used to authenticate to registry. Could be service principal ID | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Container Registry. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_agent_container_group_id"></a> [agent\_container\_group\_id](#output\_agent\_container\_group\_id) | The ID of the container Group the Agent was deployed in |
| <a name="output_agent_pool_name"></a> [agent\_pool\_name](#output\_agent\_pool\_name) | Name of Pool agent was deployed to |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
