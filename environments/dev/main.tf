# Resource Group
module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

# VNET
module "network" {
  depends_on = [ module.resource_group ]
  source   = "../../modules/azurerm_networking"
  networks = var.networks
}

# Public IP
module "public_ip" {
    depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
}

# Key Vault
module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_key_vault"
  key_vaults = var.key_vaults
}

# sql Server
module "sql_server" {
  depends_on      = [module.resource_group]
  source          = "../../modules/azurerm_sql_server"
  sql_server_name = "sql-dev-todoapp-0499"
  rg_name         = "rg-pilu-dev-todoapp-01"
  location        = "centralindia"
  admin_username  = "devopsadmin"
  admin_password  = "P@ssw01rd@123"
  tags            = {}
}

# sql db
module "sql_db" {
  depends_on  = [module.sql_server]
  source      = "../../modules/azurerm_sql_database"
  sql_db_name = "sqldb-dev-todoapp"
  server_id   = module.sql_server.server_id
  max_size_gb = "2"
  tags        = {}
}

# vms
module "vms" {
  depends_on = [module.network, module.subnet, module.public_ip]
  source     = "../../modules/azurerm_compute"

  vms           = var.vms
  subnet_ids    = module.subnet.subnet_ids   # ✅ CORRECT
  public_ip_ids = module.public_ip.public_ip_ids
}

module "subnet" {
  depends_on = [module.network]
  source     = "../../modules/azurerm_subnet"
  networks   = var.networks
}

