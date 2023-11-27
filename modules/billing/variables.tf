# Project ID
variable "project_id" {
    type = string
    description = "Project ID <type: String>"
}

# Pub/Sub ID
variable "pubsub_topic_id" {
    type = string
    description = "Pub/Sub ID <type: String>"
}

# Billing Account (Sensitive)
variable "billing_account" {
    type = string
    sensitive = true
    description = "Billing Account (Sensitive) <type: String>"
}

# Billing Name
variable "billing_name" {
    type = string
    default = "default-billing-name"
    description = "Billing Name <type: String>"
}