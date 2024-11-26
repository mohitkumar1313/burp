variable "bucket_name" {
  description = "The name of the GCS bucket"
}

variable "region" {
  description = "The region where the bucket will be created"
}

variable "storage_class" {
  description = "The storage class of the bucket"
  default     = "STANDARD"
}

variable "lifecycle_age" {
  description = "The age of objects in days before they are deleted"
  default     = 30
}

variable "force_destroy" {
  description = "Whether to force destroy the bucket (deletes objects as well)"
  default     = false
}

variable "versioning" {
  description = "Enable versioning for the bucket"
  default     = true
}

variable "kms_key_name" {
  description = "KMS key name for bucket encryption"
  default     = null
}

variable "environment" {
  description = "Environment label for the bucket"
  default     = "dev"
}
