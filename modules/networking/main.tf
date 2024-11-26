# VPC
resource "google_compute_network" "vpc" {
  name                    = "my-vpc"
  auto_create_subnetworks = false
}

# Reserve Private IP Range for Service Networking
resource "google_compute_global_address" "service_networking" {
  name          = "service-networking-ip-range"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.vpc.self_link
}

# Peering Connection
resource "google_compute_network_peering" "service_networking" {
  name         = "service-networking"
  network      = google_compute_network.vpc.self_link
  peer_network = "projects/${var.project_id}/global/networks/servicenetworking"
}

# Private Services Connection
resource "google_service_networking_connection" "private_connection" {
  network                 = google_compute_network.vpc.self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.service_networking.name]
}
resource "google_compute_subnetwork" "public_subnet" {
  name          = var.public_subnet_name
  ip_cidr_range = var.public_subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc.id
}

resource "google_compute_subnetwork" "private_subnet" {
  name          = var.private_subnet_name
  ip_cidr_range = var.private_subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc.id
}