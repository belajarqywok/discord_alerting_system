# Bucket Name Output
output "bucket_name_output" {
  value = google_storage_bucket.storage_bucket_function.name
  description = "Bucket Name Output <type: String>"
}

# Bucket Zip Name Output
output "bucket_zip_name_output" {
  value = google_storage_bucket_object.zip.name
  description = "Bucket Zip Name Output <type: String>"
}

# Bucket Location Output
output "bucket_location_output" {
  value = google_storage_bucket.storage_bucket_function.location
  description = "Bucket Location Output <type: String>"
}

# Bucket Project Output
output "bucket_project_output" {
  value = google_storage_bucket.storage_bucket_function.project
  description = "Bucket Project Output <type: String>"
}
