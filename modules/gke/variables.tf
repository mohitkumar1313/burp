variable "cluster_name" {
  description = "The name of the GKE cluster"
}

variable "region" {
  description = "The region to deploy the cluster"
}

variable "network_name" {
  description = "The name of the VPC network"
}

variable "subnetwork_name" {
  description = "The name of the subnetwork"
}

variable "node_locations" {
  description = "List of zones where nodes should be created"
  default     = []
}

variable "initial_node_count" {
  description = "The initial number of nodes per zone in the node pool"
  default     = 1
}

variable "node_machine_type" {
  description = "The machine type to use for nodes"
  default     = "e2-medium"
}

variable "node_disk_size" {
  description = "The disk size for each node (in GB)"
  default     = 10
}

variable "preemptible_nodes" {
  description = "Whether to use preemptible nodes"
  default     = false
}

variable "min_node_count" {
  description = "Minimum number of nodes for autoscaling"
  default     = 1
}

variable "max_node_count" {
  description = "Maximum number of nodes for autoscaling"
  default     = 3
}
