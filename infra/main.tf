provider "azurerm" {
  features {}
  subscription_id = "719408f0-ec64-4930-a863-a4003a850e2f"
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  express_vulnerability_assessment_enabled = false
  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_mssql_database" "sql_db" {
  name               = var.database_name
  server_id          = azurerm_mssql_server.sql_server.id
  collation          = "SQL_Latin1_General_CP1_CI_AS"
  sku_name           = "Basic"
  max_size_gb        = 2
  depends_on = [azurerm_mssql_server.sql_server]
}
