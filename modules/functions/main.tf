resource "google_cloudfunctions_function" "cloud_functions" {
    name = var.functions_name
    project = var.functions_project_id
    region = var.functions_region

    runtime = var.functions_runtime
    description = var.functions_description
  
    # source_archive_bucket = google_storage_bucket.Cloud_function_bucket.name
    source_archive_bucket = var.storage_name

    # source_archive_object = google_storage_bucket_object.zip.name
    source_archive_object = var.storage_zip_name

    entry_point = var.functions_entrypoint
    # trigger_http = var.functions_http_trigger

    event_trigger {
        resource = "projects/${
            var.functions_project_id
        }/topics/${
            var.functions_event_resource
        }"
        
        event_type = var.functions_event_type

        failure_policy {
            retry = var.functions_retry_policy
        }
    }

    timeout = var.functions_timeout
    min_instances = var.functions_min_instance
    max_instances = var.functions_max_instance
    available_memory_mb = var.functions_memory

    environment_variables = var.functions_envars

    depends_on = [
        # google_storage_bucket.Cloud_function_bucket,
        var.storage_name,

        # google_storage_bucket_object.zip,
        var.storage_zip_name
    ]
}
