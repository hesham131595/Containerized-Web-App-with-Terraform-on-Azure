output "acr_username_secret" {
  value = azurerm_key_vault_secret.acr_username.value
}

output "acr_password_secret" {
  value = azurerm_key_vault_secret.acr_password.value
  sensitive = true
}
