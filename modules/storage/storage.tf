resource "google_storage_bucket" "storage_bucket_function" {
    name     = "${var.storage_name}-${var.storage_project_id}"
    location = var.storage_region
    project  = var.storage_project_id
}

data "archive_file" "source" {
    type        = "zip"
    source_dir  = var.source_directory
    output_path = "./artifacts/${var.storage_name}.zip"

    excludes = var.archive_file_excludes
}

resource "google_storage_bucket_object" "zip" {
    source       = data.archive_file.source.output_path
    content_type = "application/zip"
    name         = "src-${data.archive_file.source.output_md5}.zip"
    bucket       = google_storage_bucket.storage_bucket_function.name

    depends_on = [
        google_storage_bucket.storage_bucket_function,
        data.archive_file.source
    ]
} 
