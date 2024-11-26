output "instance_connection_name" {
  value = google_sql_database_instance.default.connection_name
}

output "private_ip_address" {
  value = google_sql_database_instance.default.private_ip_address
}

output "database_name" {
  value = google_sql_database.default.name
}
