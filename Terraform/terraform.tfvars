## resource group Variables
resource_group_name = "stretchai"
location            = "Canada EAST"
## Azure Container Registry Variables

acr_name = "stretchacr"
acr_sku  = "Basic"

## Key Vault Variables
kv_name                  = "stretchkv"
acr_username_secret_name = "stretchacr-username1"
acr_password_secret_name = "stretchacr-password1"

## network variables
network_name          = "stretch-vnet"
address_space         = ["10.0.0.0/16"]
subnet_name           = "stretch-subnet"
subnet_address_prefix = ["10.0.1.0/24"]

## appservice Variables
webapp_name = "stretch-webapp"
image_name  = "mycontainerimage:latest"

## Azure Service Plan Variables
azurerm_service_plan_location = "Canada EAST"
