output "vpc_self_link" {
  value = google_compute_network.vpc.self_link
}

output "public_subnet_id" {
  value = google_compute_subnetwork.public_subnet.id
}

output "private_subnet_id" {
  value = google_compute_subnetwork.private_subnet.id
}

