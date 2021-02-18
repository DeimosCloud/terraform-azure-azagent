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

## Doc generation

Code formatting and documentation for variables and outputs is generated using [pre-commit-terraform hooks](https://github.com/antonbabenko/pre-commit-terraform) which uses [terraform-docs](https://github.com/segmentio/terraform-docs).

Follow [these instructions](https://github.com/antonbabenko/pre-commit-terraform#how-to-install) to install pre-commit locally.

And install `terraform-docs` with
```bash
go get github.com/segmentio/terraform-docs
```
or
```bash
brew install terraform-docs.
```

## Contributing

Report issues/questions/feature requests on in the issues section.

Full contributing guidelines are covered [here](CONTRIBUTING.md).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| azuredevops | >= 0.0.1 |
| azurerm | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| azuredevops | >= 0.0.1 |
| azurerm | >= 2.0 |
| null | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| azp\_pool\_name | The URL of the Azure DevOps or Azure DevOps Server instance | `string` | `"Default"` | no |
| azp\_token | Azure DevOps Token | `string` | n/a | yes |
| azp\_url | The URL of the Azure DevOps or Azure DevOps Server instance | `string` | n/a | yes |
| cpu | The required number of CPU cores of the containers. Changing this forces a new resource to be created. | `string` | `"0.5"` | no |
| create\_image | Whether to create the image and push to registry. If image already exists no need to push | `bool` | `false` | no |
| image\_name | Name of docker image to create or pull from for the agent | `string` | `"dockeragent"` | no |
| image\_tag | Image Tag | `string` | `"latest"` | no |
| memory | The required memory of the containers in GB. Changing this forces a new resource to be created. | `string` | `"1.5"` | no |
| prefix | The prefix for all created resources | `string` | `"linux-agent"` | no |
| registry\_secret | Password for user to be used for container authentication | `string` | `null` | no |
| registry\_url | URL of Registry to deploy Container to | `string` | `null` | no |
| registry\_username | The username used to authenticate to registry. Could be service principal ID | `string` | `null` | no |
| resource\_group\_name | The name of the resource group in which to create the Container Registry. Changing this forces a new resource to be created. | `string` | n/a | yes |
| tags | A mapping of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| agent\_container\_group\_id | The ID of the container Group the Agent was deployed in |
| agent\_pool\_name | Name of Pool agent was deployed to |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
