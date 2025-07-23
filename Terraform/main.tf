module "rg" {
  source              = "./modules/rg"
  rg_name = var.resource_group_name
  location            = var.location
}

module "acr" {
  depends_on = [module.rg]
  source                              = "./modules/acr"
  acr_name                            = var.acr_name
  acr_sku                             = var.acr_sku
  resource_group_name                 = module.rg.rg_name
  location                            = module.rg.location
}

module "key_vault" {
  depends_on = [module.acr]
  source              = "./modules/key_vault"
  kv_name             = var.kv_name
  location            = module.rg.location
  resource_group_name = module.rg.rg_name
  acr_username        = module.acr.admin_username
  acr_password        = module.acr.admin_password
  acr_username_secret_name = var.acr_username_secret_name
  acr_password_secret_name = var.acr_password_secret_name
}

module "network" {
  depends_on = [module.rg]
  source              = "./modules/network"
  vnet_name           = var.network_name
  address_space       = var.address_space
  subnet_name         = var.subnet_name
  subnet_address_prefix = var.subnet_address_prefix
  location            = module.rg.location
  resource_group_name = module.rg.rg_name
}


module "appservice" {
  depends_on = [module.key_vault]
  source                     = "./modules/appservice"
  name                       = var.webapp_name
  location                   = module.rg.location
  azurerm_service_plan_location = var.azurerm_service_plan_location
  resource_group_name        = module.rg.rg_name
  image_name                 = var.image_name
  acr_login_server           = module.acr.login_server
  acr_username_secret_uri        = module.key_vault.acr_username_secret
  acr_password_secret_uri       = module.key_vault.acr_password_secret
}
