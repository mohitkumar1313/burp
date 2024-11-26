provider "google" {
  project = var.project_id
  region  = var.region
}

module "networking" {
  source               = "./modules/networking"
  vpc_name             = "my-vpc"                  # VPC name
  project_id           = var.project_id            # GCP project ID
  region               = var.region                # GCP region
  public_subnet_name   = "public-subnet"           # Public subnet name
  public_subnet_cidr   = "10.0.1.0/24"             # Public subnet CIDR
  private_subnet_name  = "private-subnet"          # Private subnet name
  private_subnet_cidr  = "10.0.2.0/24"             # Private subnet CIDR
}

output "vpc_self_link" {
  value = module.networking.vpc_self_link
}

output "public_subnet_id" {
  value = module.networking.public_subnet_id
}

output "private_subnet_id" {
  value = module.networking.private_subnet_id
}



module "sql" {
  source             = "./modules/sql"
  instance_name      = "my-sql-instance"
  database_version   = "POSTGRES_13"
  region             = var.region
  machine_type       = "db-custom-1-3840"
  private_network    = module.networking.vpc_self_link
  database_name      = "my_database"
  username           = "admin"
  password           = "securepassword123"

}
module "gke" {
  source             = "./modules/gke"
  cluster_name       = "my-gke-cluster"
  region             = var.region
  network_name       = module.networking.vpc_self_link
  subnetwork_name    = module.networking.private_subnet_id
  node_machine_type  = "e2-medium"
  node_disk_size     = 10
  preemptible_nodes  = false
  min_node_count     = 1
  max_node_count     = 3
  initial_node_count = 1
  node_locations     = ["us-central1-a", "us-central1-b"]
}

module "storage" {
  source          = "./modules/storage"
  bucket_name     = "my-storage-bucket"
  region          = var.region
  storage_class   = "STANDARD"
  lifecycle_age   = 90
  force_destroy   = true
  versioning      = true
  kms_key_name    = "projects/<PROJECT_ID>/locations/<REGION>/keyRings/<KEY_RING>/cryptoKeys/<KEY>"
  environment     = "prod"
}


