variable "instance_name" {
  description = "The name of the Cloud SQL instance"
}

variable "database_version" {
  description = "The database engine version (e.g., POSTGRES_13)"
}

variable "region" {
  description = "The region where the SQL instance will be deployed"
}

variable "machine_type" {
  description = "The machine type/tier for the Cloud SQL instance"
}

variable "private_network" {
  description = "The self-link of the private network to connect the SQL instance"
}

variable "database_name" {
  description = "The name of the database to create"
}

variable "username" {
  description = "The username for the database user"
}

variable "password" {
  description = "The password for the database user"
}
variable "disk_size" {
  description = "The size of the disk for the Cloud SQL instance (in GB)"
  default     = 10
}

variable "disk_type" {
  description = "The type of the disk for the Cloud SQL instance (PD_SSD or PD_HDD)"
  default     = "PD_SSD"
}
