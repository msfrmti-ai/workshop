terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}
provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-10"
    storage_account_name = "workshop111"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

resource "azurerm_service_plan" "example" {
  name                = "user10uut"
  location            = "westeurope"
  resource_group_name = "rg-10"
  os_type             = "Linux"
  sku_name            = "P0v3"
}


resource "azurerm_linux_web_app" "example" {
  name                = "rtegytyhgijyuokiu"
  location            = "westeurope"
  resource_group_name = "rg-10"
  service_plan_id     = azurerm_service_plan.example.id
  site_config {}
}
