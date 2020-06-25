output "agent_pool_name" {
  description = "Name of Pool agent was deployed to"
  value       = var.azp_pool_name
}

output "agent_container_group_id" {
  description = "The ID of the container Group the Agent was deployed in"
  value       = azurerm_container_group.cg.id
}
