output "resource_group_id" {
  description = "The ID of the Resource Group"
  value       = azurerm_resource_group.rg.id
}

output "resource_group_name" {
  description = "The name of the Resource Group"
  value       = azurerm_resource_group.rg.name
}

output "static_web_app_default_host_name" {
  description = "The default host name of the Static Web App"
  value       = azurerm_static_web_app.swa.default_host_name
}

output "static_web_app_api_key" {
  description = "The API key of the Static Web App"
  value       = azurerm_static_web_app.swa.api_key
  sensitive   = true
}

output "dns_name_servers" {
  description = "The name servers of the DNS Zone"
  value       = azurerm_dns_zone.dns.name_servers
}
