# Google Cloud Storage Name
variable "storage_name" {
    type = string
    description = "Google Cloud Storage Name <type: String>"
}

# Google Cloud Storage Zip Name
variable "storage_zip_name" {
    type = string
    description = "Google Cloud Storage Zip Name <type: String>"
}



# Cloud Functions Name
variable "functions_name" {
    type = string
    default = "cloud-function-alerting"
    description = "Cloud Functions Name <type: String>"
}

# Cloud Functions Project ID
variable "functions_project_id" {
    type = string
    description = "Cloud Functions Project ID <type: String>"
}

# Cloud Functions Region
variable "functions_region" {
    type = string
    default = "asia-southeast2"
    description = "Cloud Functions Region <type: String>"
}

# Cloud Functions Description
variable "functions_description" {
    type = string
    default = <<-EOT
        Google Cloud Functions is a serverless execution environment
        for building and connecting cloud services. With Cloud Functions
        you write simple, single-purpose functions that are attached to
        events emitted from your cloud infrastructure and services.
    EOT

    description = "Cloud Functions Description <type: String>"
}

# Cloud Functions Runtime
variable "functions_runtime" {
    type = string
    default = "go121"
    description = "Cloud Functions Runtime <type: String>"
}

# Cloud Functions Entrypoint
variable "functions_entrypoint" {
    type = string
    default = "qywok_ganteng_sekali_aamiin"
    description = "Cloud Functions Entrypoint <type: String>"
}

# Cloud Functions HTTP Trigger
# variable "functions_http_trigger" {
#     type = bool
#     default = false
#     description = "Cloud Functions HTTP Trigger <type: String>"
# }

# Cloud Functions Event Type
variable "functions_event_type" {
    type = string
    default = "google.pubsub.topic.publish"
    description = "Cloud Functions Event Type <type: String>"
}

# Cloud Functions Event Resource (Pub/Sub topic ID)
variable "functions_event_resource" {
    type = string
    description = "Cloud Functions Event Resource <type: String>"
}

# Cloud Functions Retry Policy
variable "functions_retry_policy" {
    type = bool
    default = false
    description = "Cloud Functions Retry Policy <type: Bool>"
}

# Cloud Functions Memory
variable "functions_memory" {
    type = number
    default = 256
    description = "Cloud Functions Memory <type: String>"
}

# Cloud Functions Timeout
variable "functions_timeout" {
    type = number
    default = 60
    description = "Cloud Functions Timeout <type: String>"
}

# Cloud Functions Minimum Instance (Scale Down)
variable "functions_min_instance" {
    type = number
    default = 0
    description = "Cloud Functions Minimum Instance <type: Number>"
}

# Cloud Functions Minimum Instance (Scaling Up)
variable "functions_max_instance" {
    type = number
    default = 1
    description = "Cloud Functions Minimum Instance <type: Number>"
}

# Cloud Functions Environment Variables
variable "functions_envars" {
    type = map(string)
    default = {
        DISCORD_BOT_NAME = "MAMANK GAROX"
        DISCORD_BOT_AVATAR = "https://qph.cf2.quoracdn.net/main-qimg-c2108cee7b7917f80d8f6182a7a0a8ee-lq"
        DISCORD_WEBHOOK_ID = "1234567890"
        DISCORD_WEBHOOK_TOKEN = "aBcDeFgHiJkLmN"
        DISCORD_TEAM_TAG = "@everyone "
    }

    description = "Cloud Functions Environment Variables <type: map(String)>"
}
