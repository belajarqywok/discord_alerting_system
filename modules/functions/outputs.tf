# Cloud Functions Name Output
output "functions_name_output" {
    value = google_cloudfunctions_function.cloud_functions.name
    description = "Cloud Functions Name Output <type: String>"
}

# Cloud Functions Region Output
output "functions_region_output" {
    value = google_cloudfunctions_function.cloud_functions.region
    description = "Cloud Functions Region Output <type: String>"
}

# Cloud Functions Description Output
output "functions_description_output" {
    value = google_cloudfunctions_function.cloud_functions.description
    description = "Cloud Functions Description Output <type: String>"
}

# Cloud Functions Runtime Output
output "functions_runtime_output" {
    value = google_cloudfunctions_function.cloud_functions.runtime
    description = "Cloud Functions Runtime Output <type: String>"
}

# Cloud Functions Entrypoint Output
output "functions_entrypoint_output" {
    value = google_cloudfunctions_function.cloud_functions.entry_point
    description = "Cloud Functions Entrypoint Output <type: String>"
}

# Cloud Functions Timeout Output
output "functions_timeout_output" {
    value = google_cloudfunctions_function.cloud_functions.timeout
    description = "Cloud Functions Timeout Output <type: Number>"
}

# Cloud Functions Min Instance Output
output "functions_min_instance_output" {
    value = google_cloudfunctions_function.cloud_functions.min_instances
    description = "Cloud Function Min Instance Output <type: Number>"
}

# Cloud Functions Max Instance Output
output "functions_max_instance_output" {
    value = google_cloudfunctions_function.cloud_functions.max_instances
    description = "Cloud Function Max Instance Output <type: Number>"
}

# Cloud Functions Memory Output
output "functions_memory_output" {
    value = google_cloudfunctions_function.cloud_functions.available_memory_mb
    description = "Cloud Functions Memory Output <type: Number>"
}
