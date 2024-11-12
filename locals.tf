######################################################
##                     Project                      ##
######################################################
locals {
  tags = {
    "Managed"     = "Terraform"
    "Project"     = var.project
    "Environment" = var.environment
    "Location"    = var.location
    "Author"      = var.author
  }
}

######################################################
##                Naming Convention                 ##
######################################################
locals {
  name_suffix           = "${var.project}-${var.environment}-${var.location}"
  resource_group_name   = "rg-${local.name_suffix}"
  app_name              = "web-${local.name_suffix}"
  app_name_container    = "web-${local.name_suffix}-container"
  app_service_plan_name = "plan-${local.name_suffix}"
}