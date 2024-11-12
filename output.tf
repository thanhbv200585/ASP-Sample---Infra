output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "location" {
  value = module.resource_group.resource_group_location
}

output "web_app_url" {
  value = module.web_app.web_app_url
}

output "app_service_plan_id" {
  value = module.app_service_plan.app_service_plan_id
}
