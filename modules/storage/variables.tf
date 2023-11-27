# Storage Name
variable "storage_name" {
    type = string
    description = "Storage Name <type: String>"
}

# Storage Region
variable "storage_region" {
    type = string
    default = "asia-southeast2"
    description = "Storage Region <type: String>"
}

# Storage Project ID
variable "storage_project_id" {
    type = string
    description = "Storage Project ID <type: String>"
}

# Archive File Excludes
variable "archive_file_excludes" {
    type = set(string)
    description = "Archive File Excludes Files <type: set(String)>"
}

# Source Directory
variable "source_directory" {
    type = string
    default = "./"
    description = "Source Directory <type: String>"
}
