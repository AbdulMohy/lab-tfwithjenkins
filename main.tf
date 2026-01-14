provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "network_rg" {
  name     = "amk-network-dev-rg"   # ✅ correct
  location = "East US"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "amk-vnet-dev"   # ✅ correct
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.network_rg.location
  resource_group_name = azurerm_resource_group.network_rg.name
}
resource "azurerm_subnet" "subnet1" {
  name                 = "amk-subnet-dev"
  resource_group_name  = azurerm_resource_group.network_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
