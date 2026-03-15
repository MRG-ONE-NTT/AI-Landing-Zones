terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateonenttdachailz"  # Use a unique name for storage account 
    container_name       = "tfstate"
    key                  = "ai-landing-zone.tfstate"
  }
}