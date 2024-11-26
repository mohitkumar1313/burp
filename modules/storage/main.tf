resource "google_storage_bucket" "bucket" {
  name                        = var.bucket_name
  location                    = var.region
  storage_class               = var.storage_class
  force_destroy               = var.force_destroy
  uniform_bucket_level_access = true

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = var.lifecycle_age
    }
  }

  versioning {
    enabled = var.versioning
  }

  encryption {
    default_kms_key_name = var.kms_key_name
  }

  labels = {
    environment = var.environment
    module      = "storage"
  }
}
