# Configure Azure Provider
terraform {
  backend "azurerm" {
    resource_group_name  = "__resource_group_name__"
    storage_account_name = "__storage_account_name__"
    container_name       = "__container_name__"
    key                  = "__key__"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.113.0"
    }
  }
  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

# Call Resource Group Module
module "resource_group" {
  source              = "./modules/azurerm_resource_group"
  resource_group_name = local.resource_group_name
  location            = var.location
}

# Call App Service Plan Module
module "app_service_plan" {
  source                = "./modules/azurerm_service_plan"
  resource_group_name   = module.resource_group.resource_group_name
  location              = module.resource_group.resource_group_location
  sku_name              = var.sku_name
  app_service_plan_name = local.app_service_plan_name
}

# Call Web App Module
module "web_app" {
  source              = "./modules/azurerm_windows_web_app"
  app_name            = local.app_name
  app_name_container  = local.app_name_container
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  service_plan_id     = module.app_service_plan.app_service_plan_id
  repo_url            = var.repo_url
  branch              = var.branch
  dotnet_version      = var.dotnet_version
}

# Call Database Module
module "sql_server" {
  source                       = "./modules/azurerm_sql_server"
  resource_group_name          = module.resource_group.resource_group_name
  location                     = module.resource_group.resource_group_location
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

module "mssql_database" {
  source              = "./modules/azurerm_mssql_database"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  database_name       = var.database_name
  server_id           = module.sql_server.id
}


