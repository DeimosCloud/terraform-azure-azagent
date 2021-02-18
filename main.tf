data azurerm_resource_group "cg" {
  name = var.resource_group_name
}

resource "random_id" "this" {
  byte_length = "8"
}

locals {
  image_name = "${var.registry_url}/${var.image_name}:${var.image_tag}"
  agent_name = "${var.prefix}-${random_id.this.hex}"
}


resource "null_resource" "deploy_container" {
  count = var.create_image ? 1 : 0
  provisioner "local-exec" {
    command = <<EOT
      docker build -t ${local.image_name} "${path.module}/dockeragent/"
      az acr login -n ${local.image_name}
      docker push ${local.image_name}
      EOT
  }
}

# Create a New Pool when Default Pool is not in use
resource "azuredevops_agent_pool" "pool" {
  count          = var.azp_pool_name == "Default" ? 0 : 1
  name           = var.azp_pool_name
  auto_provision = false
}


resource "azurerm_container_group" "cg" {
  name                = "${var.prefix}-container-group"
  location            = data.azurerm_resource_group.cg.location
  resource_group_name = data.azurerm_resource_group.cg.name
  os_type             = "Linux"


  image_registry_credential {
    username = var.registry_username
    password = var.registry_secret
    server   = var.registry_url
  }

  container {
    name   = "${var.prefix}-walinuxagent"
    image  = local.image_name
    cpu    = var.cpu
    memory = var.memory

    environment_variables = {
      AZP_TOKEN      = var.azp_token
      AZP_URL        = var.azp_url
      AZP_AGENT_NAME = local.agent_name
      AZP_POOL       = var.azp_pool_name
    }
    ports {
      port     = 443
      protocol = "TCP"
    }
  }

  tags       = var.tags
  depends_on = [null_resource.deploy_container, azuredevops_agent_pool.pool]
}
