provider "azurerm" {}

resource "azurerm_resource_group" "test" {
  name     = "test-ealen-rg"
  location = "francecentral"
}
