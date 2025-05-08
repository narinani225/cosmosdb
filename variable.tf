variable "tenant_id" {
  description = "mention your tenant id"
  default = ""
}
variable "subscription_id" {
  description = "mention your subscription id "
  default = ""
}
variable "cosmos_db_name" {
  type = string
  default = ""
}
variable "resource_group_name" {
  type = string
  default = ""
}
variable "location" {
  type = string
  default = ""
}
variable "cosmos_password" {
  type = string
  default = ""
}
variable "vcore_count" {
  description = " mention your vcore_count"
  default = "2"
}
variable "node_count" {
  description = "mention your node_count"
  default = "2"
}
variable "storage_quota_in_mb" {
  default = 131072
}
variable "node_storage_quota_in_mb" {
  default = 524288
}
variable "node_vcores" {
  description = "mention your node_vcores"
  default = "2"
}
variable "configuration_name" {
  description = "mention your configuration_name"
  default = "work_mem"
}
variable "value" {
  default = "16384"
}
variable "postgres_pe_name" {
  description = "mention your postgres_pe_name "
  default = ""
}
 variable "subnet_id" {
   description = "mention your subnet_id "
 }
variable "subnet_location" {
  description = "mention your subnet_location "
  default = ""
}
variable "psc_connection_name" {
  description = "mention your psc_connection_name"
  default = "
"
}
# variable "private_connection_resource_id" {
#   description = "mention your private_connection_resource_id "
# }
variable "is_manual_connection" {
  default = false
}
variable "subresource_names" {
  default = ["coordinator"]
}
variable "citus_version" {
  description = "mentin citus version"
  default = "12.1"
}
variable "coordinator_server_edition" {
  default = "GeneralPurpose"
}
variable "ha_enabled" {
  default = false
}
variable "node_server_edition" {
  default = "GeneralPurpose"
}
# variable "point_in_time_in_utc" {
#   default = "2025-05-06T15:30:00Z"
# }
variable "preferred_primary_zone" {
  description = "Preferred availability zone for the coordinator node (e.g., '1', '2', or '3')"
  type        = string
  default     = "1"
}
variable "shards_on_coordinator_enabled" {
  description = "Whether to store shards on the coordinator node"
  type        = bool
  default     = false
}
variable "maintenance_day" {
  description = "Day of the week for maintenance (e.g., Monday, Tuesday)"
  type        = string
  default     = "0"
}

variable "maintenance_hour" {
  description = "Hour (UTC) when maintenance window begins (0-23)"
  type        = number
  default     = 2
}
variable "maintenance_minute" {
  description = "Minute (0-59) when maintenance window begins"
  type        = number
  default     = 0  # Optional default value
}
