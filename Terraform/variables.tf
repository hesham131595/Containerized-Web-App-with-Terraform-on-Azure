## resource group Variables

variable "resource_group_name" {
  description = "The name of the resource group where the Azure resources will be created."
  type        = string
}
variable "location" {
  description = "The Azure Region where the Azure resources will be created."
  type        = string
}

## Azure Container Registry Variables

variable "acr_name" {
  description = "The name of the Azure Container Registry."
  type        = string
}
variable "acr_sku" {
  description = "The SKU of the Azure Container Registry."
  type        = string
}

## Key Vault Variables

variable "kv_name" {
  description = "The name of the Key Vault"
  type        = string
}
variable "acr_username_secret_name" {
  description = "The name of the secret for the Azure Container Registry username"
  type        = string
}
variable "acr_password_secret_name" {
  description = "The name of the secret for the Azure Container Registry password"
  type        = string
}

## network Variables

variable "network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "subnet_address_prefix" {
  description = "The address prefix for the subnet"
  type        = list(string)
}

## appservice Variables

variable "webapp_name" {
  description = "The name of the App Service"
  type        = string
}
variable "image_name" {
  description = "The name of the container image to deploy"
  type        = string
}
variable "azurerm_service_plan_location" {
  description = "The location for the Azure Service Plan"
  type        = string
}