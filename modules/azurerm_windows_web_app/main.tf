resource "azurerm_windows_web_app" "webapp" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id
  https_only          = trueIO2

  site_config {
    always_on           = false
    minimum_tls_version = var.minimum_tls_version
    application_stack {
      dotnet_version = var.dotnet_version
    }
  }
}