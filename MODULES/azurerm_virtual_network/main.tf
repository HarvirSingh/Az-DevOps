resource "azurerm_virtual_network" "todo_vnet" {
  name                = var.virtual_network_name
  location            = var.virtual_network_location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
 }