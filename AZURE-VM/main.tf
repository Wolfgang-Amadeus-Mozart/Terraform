terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.49.0"
    }
  }

  #defining where the backend (state file from this config) will be created
  backend "azurerm" {
    resource_group_name = "rg-terraform-state"
    storage_account_name = "filipeterraformstate"
    container_name = "remote-state"
    key = "azure-vm/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

#configuring data source
#This will get data from the already existing state file located on azure cloud
data "terraform_remote_state" "vnet-remote-state" { 
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "filipeterraformstate"
    container_name       = "remote-state"
    key                  = "azure-vnet/terraform.tfstate"
  }
}
