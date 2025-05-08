terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.76.0"  # or simply remove the version constraint to allow the latest version
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  skip_provider_registration = true
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}
data "azurerm_subnet" "demo_subnet" {
  name                 = "Orange"          # Replace with your subnet name
  virtual_network_name = "Apple-vnet"            # Replace with your virtual network name
  resource_group_name  = "Amboge" # Link to the existing resource group
}


# Create a Cosmos DB PostgreSQL Cluster
resource "azurerm_cosmosdb_postgresql_cluster" "cosmos_db" {
  name                            = var.cosmos_db_name
  depends_on = [ azurerm_resource_group.example ]
  resource_group_name             = var.resource_group_name
  location                        = var.location
  administrator_login_password    = var.cosmos_password
  coordinator_storage_quota_in_mb = var.storage_quota_in_mb
  coordinator_vcore_count         = var.vcore_count
  node_count                      = var.node_count
  coordinator_server_edition      = var.coordinator_server_edition
  node_storage_quota_in_mb        = var.node_storage_quota_in_mb        # Adjusted worker disk size to a valid value (e.g., 10 GB)
  node_vcores                     = var.node_vcores
  citus_version                    = var.citus_version
  ha_enabled                       = var.ha_enabled
  node_server_edition              = var.node_server_edition
 # point_in_time_in_utc            = var.point_in_time_in_utc
  preferred_primary_zone           = var.preferred_primary_zone
  shards_on_coordinator_enabled    = var.shards_on_coordinator_enabled

   maintenance_window {
    day_of_week = var.maintenance_day
    start_hour  = var.maintenance_hour 
    start_minute = var.maintenance_minute
  }
}

# Configure PostgreSQL Node Settings
resource "azurerm_cosmosdb_postgresql_node_configuration" "postgresql_configuration" {
  name       = var.configuration_name
  cluster_id = azurerm_cosmosdb_postgresql_cluster.cosmos_db.id
  value      = var.value
}

# Create a Private Endpoint for Cosmos DB for PostgreSQL
resource "azurerm_private_endpoint" "postgres_private_endpoint" {
  name                = var.postgres_pe_name
  location            = var.subnet_location  #var.subnet_location
  resource_group_name = var.resource_group_name
  subnet_id           = data.azurerm_subnet.demo_subnet.id


  private_service_connection {
    name                           = var.psc_connection_name
    private_connection_resource_id = azurerm_cosmosdb_postgresql_cluster.cosmos_db.id #var.private_connection_resource_id
    is_manual_connection           = var.is_manual_connection
    subresource_names              = var.subresource_names
}
}