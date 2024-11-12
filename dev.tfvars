# global
project     = "dotnetFastTrack"
environment = "dev"
author      = "ThanhBV"

# module "web_app" 
repo_url       = "https://github.com/Azure-Samples/app-service-web-html-get-started"
branch         = "master"
dotnet_version = "v8.0"


# module "app_service_plan" 
sku_name = "F1"

# module "resource_group" 
location = "eastasia"
