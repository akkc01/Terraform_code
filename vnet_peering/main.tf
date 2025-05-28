# This will create a resource group.
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# This will create a virtual network.
resource "azurerm_virtual_network" "vnet1" {
  depends_on          = [azurerm_resource_group.rg]
  name                = var.virtual_network_name1
  address_space       = ["192.168.1.0/24"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

# This will create a virtual network.
resource "azurerm_virtual_network" "vnet2" {
  depends_on          = [azurerm_resource_group.rg]
  name                = var.virtual_network_name2
  address_space       = ["192.168.2.0/24"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

# This will create a subnet.
resource "azurerm_subnet" "vnet1-subnet1" {
  depends_on           = [azurerm_virtual_network.vnet1]
  name                 = var.subnet1
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["192.168.1.0/25"]
}


# This will create a subnet.
resource "azurerm_subnet" "vnet1-subnet2" {
  depends_on           = [azurerm_virtual_network.vnet1]
  name                 = var.subnet2
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["192.168.1.128/25"]
}

# This will create a subnet.
resource "azurerm_subnet" "vnet2-subnet1" {
  depends_on           = [azurerm_virtual_network.vnet2]
  name                 = var.subnet1
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = ["192.168.2.0/25"]
}

# This will create a subnet.
resource "azurerm_subnet" "vnet2-subnet2" {
  depends_on           = [azurerm_virtual_network.vnet2]
  name                 = var.subnet2
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = ["192.168.2.128/25"]
}

# This will create a public IP address.
resource "azurerm_public_ip" "vm1-publicip" {
  name                = "vm1-publicip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}


# This will create a public IP address.
resource "azurerm_public_ip" "vm2-publicip" {
  name                = "vm2-publicip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}

# This will create a network security group.
resource "azurerm_network_security_group" "nsg" {
  name                = "my_nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "RDP"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "web"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# This will create a network interface.
resource "azurerm_network_interface" "vnet1-nic" {
  name                = "vm1-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.vnet1-subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm1-publicip.id
  }
}

# This will create a network interface.
resource "azurerm_network_interface" "vnet2-nic" {
  name                = "vm2-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "testconfiguration2"
    subnet_id                     = azurerm_subnet.vnet2-subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm2-publicip.id
  }
}

# This will create a network interface security group association.
resource "azurerm_network_interface_security_group_association" "nsg_ass1" {
  network_interface_id      = azurerm_network_interface.vnet1-nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# This will create a network interface security group association.
resource "azurerm_network_interface_security_group_association" "nsg_ass2" {
  network_interface_id      = azurerm_network_interface.vnet2-nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# This will create a virtual machine.
resource "azurerm_windows_virtual_machine" "vnet1-vm" {
  name                = "WS2016-VM1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_F2"
  admin_username      = "akkc"
  admin_password      = "Surveillance1@123"
  network_interface_ids = [
    azurerm_network_interface.vnet1-nic.id,
  ]

# this will create a managed disk for the virtual machine.
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
# this will create a source image reference for the virtual machine.
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

# This will create a Windows virtual machine.
resource "azurerm_windows_virtual_machine" "vnet2-vm" {
  name                = "WS2016-VM2"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_F2"
  admin_username      = "akkc"
  admin_password      = "Surveillance1@123"
  network_interface_ids = [
    azurerm_network_interface.vnet2-nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

# This will create a virtual network peering.
resource "azurerm_virtual_network_peering" "vnet1-to-vnet2" {
  name                      = "vnet1-to-vnet2"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id = azurerm_virtual_network.vnet2.id
  allow_virtual_network_access = true
}

# This will create a virtual network peering.
resource "azurerm_virtual_network_peering" "vnet2-to-vnet1" {
  name                      = "vnet2-to-vnet1"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet2.name
  remote_virtual_network_id = azurerm_virtual_network.vnet1.id
  allow_virtual_network_access = true
}

