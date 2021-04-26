locals {
  virtual_machine_name = "${var.prefix}-vm"
}

provider "azurerm" {
  version = "=2.16.0"
  features {}
}

resource "azurerm_linux_virtual_machine" "tf_vm" {
  name                  = var.tf_vm_virtual_machine_name
  resource_group_name   = azurerm_resource_group.tf_vm_rg.name
  location              = azurerm_resource_group.tf_vm_rg.location
  network_interface_ids = [azurerm_network_interface.tf_vm_nic.id]
  size                  = var.machine_type

  identity {
    type = "SystemAssigned"
  }

  source_image_reference {
    publisher = "OpenLogic"
    offer     = "Centos-HPC"
    sku       = "7_8"
    version   = "latest"
  }

  os_disk {
    name              = "${local.virtual_machine_name}-osdisk"
    disk_size_gb      = var.os_disk_size_gb
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_username      = var.tf_vm_username
  admin_ssh_key {
    username   = var.tf_vm_username
    public_key = var.tf_vm_user_publickey
  }
}

resource "azurerm_virtual_machine_extension" "install_GPU_Driver" {
  name                 = "CustomScriptExtension"
  virtual_machine_id   = azurerm_linux_virtual_machine.tf_vm.id
  publisher            = "Microsoft.HpcCompute"
  type                 = "NvidiaGpuDriverLinux"
  type_handler_version = "1.3"
  auto_upgrade_minor_version = "true"
  depends_on           = [azurerm_linux_virtual_machine.tf_vm]
  settings = <<SETTINGS
    {
        "commandToExecute": ""
    }
SETTINGS    
 
}
