
resource "azurerm_service_plan" "plan" {
  name                = "${var.name}-plan"
  location            = var.azurerm_service_plan_location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "F1"

}
resource "null_resource" "wait_for_plan" {
  provisioner "local-exec" {
    command = "sleep 20"
  }

  depends_on = [azurerm_service_plan.plan]
}

resource "azurerm_linux_web_app" "webapp" {
  depends_on = [null_resource.wait_for_plan]
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
	always_on = false 
	application_stack {
		docker_image_name     = "${var.acr_login_server}/${var.image_name}:latest"
		docker_registry_url   = "https://${var.acr_login_server}"
		docker_registry_username = var.acr_username_secret_uri
		docker_registry_password = var.acr_password_secret_uri
  	}
  }

  app_settings = {
	WEBSITES_PORT = "3000"
  }


  identity {
    type = "SystemAssigned"
  }

}

resource "azurerm_log_analytics_workspace" "logs" {

  name                = "${var.name}-logs"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_diagnostic_setting" "logs" {
  depends_on = [azurerm_linux_web_app.webapp, azurerm_log_analytics_workspace.logs]
  name                       = "appservice-logs"
  target_resource_id         = azurerm_linux_web_app.webapp.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.logs.id

  enabled_log {
    category = "AppServiceAppLogs"
  }

  enabled_metric {
    category = "AllMetrics"
  }
}

