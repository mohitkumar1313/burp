resource "google_sql_database_instance" "default" {
  name             = var.instance_name
  database_version = var.database_version
  region           = var.region

  settings {
    tier             = var.machine_type
    disk_size        = var.disk_size   # Add disk size
    disk_type        = var.disk_type 
    ip_configuration {
      private_network = var.private_network
    }
  }

  deletion_protection = false
}

resource "google_sql_database" "default" {
  name     = var.database_name
  instance = google_sql_database_instance.default.name
}

resource "google_sql_user" "default" {
  name     = var.username
  instance = google_sql_database_instance.default.name
  password = var.password
}

