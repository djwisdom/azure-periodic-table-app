resource "azurerm_service_fabric_cluster" "main" {
  name                 = "sfmc-${local.naming_suffix}"
  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  reliability_level    = "Bronze"
  upgrade_mode         = "Manual"
  cluster_code_version = "7.1.456.959"
  vm_image             = "Windows"
  management_endpoint  = "https://example:80"

  node_type {
    name                 = "sfmc-${local.naming_suffix}"
    instance_count       = 3
    is_primary           = true
    client_endpoint_port = 2020
    http_endpoint_port   = 80
  }
}