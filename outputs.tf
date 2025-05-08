output "cosmos_db_id" {
  value = azurerm_cosmosdb_postgresql_cluster.cosmos_db.id
}
output "subnet_id" {
  value = data.azurerm_subnet.demo_subnet.id
}