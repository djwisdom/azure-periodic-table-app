resource "azurerm_vpn_site" "main" {
  name                = "vst-${local.naming_suffix}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  virtual_wan_id      = azurerm_virtual_wan.main.id
  address_cidrs       = ["10.0.0.0/24"]

  link {
    name       = "vst-${local.naming_suffix}"
    ip_address = "10.0.0.1"
  }
}