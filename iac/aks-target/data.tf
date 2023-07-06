data "azurerm_resource_group" "rg" {
  name = var.resource_group
}

data "azurerm_subnet" "snet" {
  name                 = var.network.snet_name
  virtual_network_name = var.network.vnet_name
  resource_group_name  = var.resource_group
}