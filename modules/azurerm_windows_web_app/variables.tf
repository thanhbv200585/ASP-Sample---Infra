variable "resource_group_name" {
  description = "(Required) The name of the Resource Group where the Linux Web App should exist. Changing this forces a new Linux Web App to be created."
  type        = string
}

variable "location" {
  description = "(Required) The Azure Region where the Linux Web App should exist. Changing this forces a new Linux Web App to be created."
  type        = string
}

variable "service_plan_id" {
  description = "(Required) The ID of the Service Plan that this Linux App Service will be created in."
  type        = string
}

variable "repo_url" {
  description = "(Optional) The URL for the repository. Changing this forces a new resource to be created."
  type        = string
}

variable "branch" {
  description = "(Optional) The branch name to use for deployments. Changing this forces a new resource to be created."
  type        = string
}

variable "use_manual_integration" {
  description = "(Optional) Should code be deployed manually. Set to false to enable continuous integration, such as webhooks into online repos such as GitHub. Defaults to false. Changing this forces a new resource to be created."
  type        = bool
  default     = true
}

variable "use_mercurial" {
  description = "(Optional) The repository specified is Mercurial. Defaults to false. Changing this forces a new resource to be created."
  type        = bool
  default     = false
}

variable "app_name" {
  description = "App Name"
  type        = string
}

variable "app_name_container" {
  description = "App Name"
  type        = string
}

variable "dotnet_version" {
  description = "DotNet version"
  type = string
}

variable "minimum_tls_version" {
  description = "TLS version"
  type = string
  default = "1.2"
}
