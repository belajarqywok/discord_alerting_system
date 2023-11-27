# Policy Project ID
variable "policy_project_id" {
    type = string
    description = "Policy Project ID <type: String>"
}

# Pub/Sub topic Name
variable "pubsub_topic_name" {
    type = string
    description = "Pub/Sub topic Name <type: String>"
}

# Pub/Sub topic ID
variable "pubsub_topic_id" {
    type = string
    description = "Pub/Sub topic ID <type: String>"
}

# Notification Channel Name
variable "notification_channel_name" {
    type = string
    default = "My Pub/Sub Channel"
    description = "Notification Channel Name <type: String>"
}



# Alert Policy Name
variable "alert_policy_name" {
    type = string
    default = "terraform logging alert"
    description = "Alert Policy Name <type: String>"
}

# Alert Policy Combiner
variable "alert_policy_combiner" {
    type = string
    default = "OR"
    description = "Alert Policy Combiner <type: String>"
}



# Alert Policy Condition Name
variable "alert_policy_condition_name" {
    type = string
    default = "Cloud Run Revision - Log entries"
    description = "Alert Policy Condition Name <type: String>"
}

# Alert Policy Condition Filter
variable "alert_policy_condition_filter" {
    type = string
    default = "resource.type = \"cloud_run_revision\""
    description = "Alert Policy Condition Filter <type: String>"
}

# Alert Policy Condition Comparison
variable "alert_policy_condition_comparison" {
    type = string
    default = "COMPARISON_GT"
    description = "Alert Policy Condition Comparison <type: String>"
}

# Alert Policy Condition Threshold
variable "alert_policy_condition_threshold" {
    type = number
    default = 0.5
    description = "Alert Policy Condition Threshold <type: Number>"
}

# Alert Policy Condition Duration
variable "alert_policy_condition_duration" {
    type = number
    default = 60
    description = "Alert Policy Condition Duration (Seconds) <type: Number>"
}

# Alert Policy Condition Alignment Period
variable "alert_policy_condition_alignment_period" {
    type = number
    default = 60
    description = "Alert Policy Condition Alignment Period (Seconds) <type: Number>"
}

# Alert Policy Condition Series Aligner
variable "alert_policy_condition_series_aligner" {
    type = string
    default = "ALIGN_RATE"
    description = "Alert Policy Condition Series Aligner <type: String>"
}
