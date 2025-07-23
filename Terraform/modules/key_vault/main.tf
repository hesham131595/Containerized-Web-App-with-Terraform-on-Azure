resource "azurerm_key_vault" "mykeyvault" {
  name                        = var.kv_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"

  soft_delete_retention_days         = 7
  purge_protection_enabled    = true
    access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "Set",
      "Delete",
      "List"
    ]
  }
}

resource "azurerm_key_vault_secret" "acr_username" {
  name         = var.acr_username_secret_name
  value        = var.acr_username
  key_vault_id = azurerm_key_vault.mykeyvault.id
}

resource "azurerm_key_vault_secret" "acr_password" {
  name         = var.acr_password_secret_name
  value        = var.acr_password
  key_vault_id = azurerm_key_vault.mykeyvault.id
}

data "azurerm_client_config" "current" {}
