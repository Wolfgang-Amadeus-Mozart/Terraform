resource "azurerm_resource_group" "azure_rg" { #creating resource group
    name ="rg-vm"
    location = var.location

    tags = local.common_tags
}

resource "azurerm_public_ip" "azure-IP" {
  name                = "azure-public-ip-terraform"
  resource_group_name = azurerm_resource_group.azure_rg.name
  location            = var.location
  allocation_method   = "Dynamic"

  tags = local.common_tags
}

resource "azurerm_network_interface" "azure-network" { #creating azure network interface
  name                = "azure-terraform-network"
  location            = var.location
  resource_group_name = azurerm_resource_group.azure_rg.name

  ip_configuration {#defining ip config
    name                          = "azure-public-ip-terraform"
    subnet_id                     = data.terraform_remote_state.vnet-remote-state.outputs.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          =  azurerm_public_ip.azure-IP.id

    
  }
  tags = local.common_tags
}

resource "azurerm_network_interface_security_group_association" "azure-sg-association" { #creating a security group
  network_interface_id = azurerm_network_interface.azure-network.id
  network_security_group_id = data.terraform_remote_state.vnet-remote-state.outputs.sgId #reading vnet info from a remote state
}


resource "azurerm_linux_virtual_machine" "vm-azure-linux" {
  name                = "azure-teraform-linux-vm"
  resource_group_name = azurerm_resource_group.azure_rg.name
  location            = var.location
  size                = "Standard_B1s"
  admin_username      = "terraform"
  network_interface_ids = [
    azurerm_network_interface.azure-network.id,
  ]

  admin_ssh_key {
    username   = "terraform"
    public_key = file("./public_key.pub") #reading a ssh key, but it removed from repo due security reasons, you may change this part to your own key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  #defining the image
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}