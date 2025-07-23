output "acr_username_secret" {
  value = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault_secret.acr_username.id})"
}

output "acr_password_secret" {
  value = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault_secret.acr_password.id})"
}
