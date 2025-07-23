output "app_service_url" {
  description = "The default URL of the Azure App Service."
  value       = "https://${module.appservice.webapp_url}"
}