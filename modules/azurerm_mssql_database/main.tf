resource "azurerm_sql_database" "main" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = "Basic"
  server_id    = var.server_id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 1
  enclave_type = "VBS"
    tags = {
    foo = "bar"
  }

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}