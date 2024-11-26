resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location           = var.region
  network            = var.network_name
  subnetwork         = var.subnetwork_name
  initial_node_count = var.initial_node_count

  remove_default_node_pool = true
  node_locations           = var.node_locations

  ip_allocation_policy {}

  deletion_protection = false
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.cluster_name}-node-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.region

  node_config {
    machine_type = var.node_machine_type
    disk_size_gb = var.node_disk_size
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    preemptible = var.preemptible_nodes
  }

  initial_node_count = var.initial_node_count
  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }
}
