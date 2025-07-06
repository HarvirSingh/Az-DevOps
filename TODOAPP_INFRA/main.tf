module "resource_group" {
  source                  = "../MODULES/azurerm_resource_group"
  resource_group_location = "centralindia"
  resource_group_name     = "rg-htodoapp"
}
module "resource_group" {
  source                  = "../MODULES/azurerm_resource_group"
  resource_group_location = "centralindia"
  resource_group_name     = "rg-cnis"
}

module "virtual_network" {
  depends_on               = [module.resource_group]
  source                   = "../MODULES/azurerm_virtual_network"
  virtual_network_name     = "vnet-htodoapp"
  virtual_network_location = "centralindia"
  resource_group_name      = "rg-htodoapp"
  address_space            = ["10.0.0.0/16"]

}
module "frontend_subnet" {
  depends_on           = [module.virtual_network]
  source               = "../MODULES/azurerm_subnet"
  subnet_name          = "frontend-h-subnet"
  resource_group_name  = "rg-htodoapp"
  virtual_network_name = "vnet-htodoapp"
  address_prefixes     = ["10.0.1.0/24"]

}
module "backend_subnet" {
  depends_on           = [module.virtual_network]
  source               = "../MODULES/azurerm_subnet"
  subnet_name          = "backend-h-subnet"
  resource_group_name  = "rg-htodoapp"
  virtual_network_name = "vnet-htodoapp"
  address_prefixes     = ["10.0.2.0/24"]

}
module "public_ip_frontend" {
  source              = "../MODULES/azurerm_public_ip"
  resource_group_name = "rg-htodoapp"
  public_ip_name      = "pip-h-frontend"
  location            = "centralindia"
  allocation_method   = "Static"

}

module "frontend_vm" {
  depends_on           = [module.frontend_subnet]
  source               = "../MODULES/azurerm_virtual_machine"
  vm_name              = "vm-h-frontend"
  vm_size              = "Standard_B1s"
  vm_location          = "centralindia"
  virtual_network_name = "vnet-htodoapp"
  subnet_name          = "frontend-h-subnet"
  resource_group_name  = "rg-htodoapp"
  admin_username       = "devopsadmin"
  admin_password       = "P@ssw0rd1234!"
  nic_name             = "nic-vm_hfrontend"
  nic_location         = "centralindia"
  pip_name             = "pip-h-frontend"
  image_offer          = "Ubuntuserver"
  image_publisher      = "Canonical"
  image_sku            = "20_04-lts"
  image_version        = "latest"

}

module "public_ip_backend" {
  source              = "../MODULES/azurerm_public_ip"
  resource_group_name = "rg-htodoapp"
  public_ip_name      = "pip-h-backend"
  location            = "centralindia"
  allocation_method   = "Static"

}

module "backend_vm" {
  depends_on           = [module.backend_subnet]
  source               = "../MODULES/azurerm_virtual_machine"
  vm_name              = "vm-h-backend"
  vm_size              = "Standard_B1s"
  vm_location          = "centralindia"
  virtual_network_name = "vnet-htodoapp"
  subnet_name          = "backend-h-subnet"
  resource_group_name  = "rg-htodoapp"
  admin_username       = "devopsadmin"
  admin_password       = "P@ssw0rd1234!"
  nic_name             = "nic-vm_hbackend"
  nic_location         = "centralindia"
  pip_name             = "pip-h-backend"
  image_offer          = "0001-com-ubuntu-server-focal"
  image_publisher      = "Canonical"
  image_sku            = "20_04-lts"
  image_version        = "latest"
}

module "sql_server"{
  source = "../MODULES/azurerm_sql_server"
  location = "centralindia"
  resource_group_name = "rg-htodoapp"
  sql_server_name = "todoapphsqlserver08"
  administrator_login = "sqladmin"
  administrator_login_password = "P@ssw0rd1234!"
}

module "sql_database"{
  depends_on = [ module.sql_server ]
  source = "../MODULES/azurerm_sql_database"
  sql_database_name = "todoapphdb"
  sql_server_id = module.sql_server.sql_server_id
  sql_server_name = "todoapphsqlserver08"
  resource_group_name = "rg-htodoapp"
}

