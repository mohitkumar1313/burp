output "bucket_name" {
  value = google_storage_bucket.bucket.name
}

output "bucket_self_link" {
  value = google_storage_bucket.bucket.self_link
}
