provider "azurerm" {}

resource "azurerm_resource_group" "test" {
  name     = "test-${var.project}-orange-rg"
  location = "francecentral"
}
