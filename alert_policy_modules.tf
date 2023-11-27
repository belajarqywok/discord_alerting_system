# Cloud Storage / Bucket for Alert Policy Service
module "storage_alert_policy_service" {
  source = "./modules/storage"

  storage_name = "alert-policy-service"
  storage_region = var.region
  storage_project_id = var.project_id

  source_directory = "./services/policy_service/"

  archive_file_excludes = [
    # Folders
    ".git",
    ".terraform",
    "configurations",
    "images",
    "modules",
    "tests",

    # Terraform files
    "main.tf",
    "variables.tf",
    ".terraform.lock.hcl",

    # Development Files
    "main.go",
    "Makefile",
    "README.md",
    ".gitignore",
    ".gcloudignore",
    "alerting-service.zip"
  ]
}


# Pub/Sub for Alert Policy Service
module "pubsub_alert_policy_service" {
  source = "./modules/pubsub"

  # Topic
  topic_name = "cloud-run-alerting-topic"

  subscription_name = "cloud-run-alerting-subscription"
  ack_deadline = 10 # 10 Seconds
  message_retention = 604800  # 7 Days
  expiration_policy_ttl = 31  # 31 Days

  retry_policy = {
    minimum_backoff = 10  # 10 Seconds
    maximum_backoff = 600  # 600 Seconds
  }
}


# Alert Policy (Cloud Monitoring)
module "alert_policy_service" {
  source = "./modules/alert_policy"
  policy_project_id = var.project_id

  # Pub/Sub Notification
  notification_channel_name = "pubsub-alerting-channel"
  pubsub_topic_id = module.pubsub_alert_policy_service.pubsub_topic_id
  pubsub_topic_name = module.pubsub_alert_policy_service.pubsub_topic_name

  # Alert Policy
  alert_policy_name = "Cloud Run Policy"
  alert_policy_combiner = "OR"

  alert_policy_condition_name = "Cloud Run Revision - Log entries"
  alert_policy_condition_comparison = "COMPARISON_GT"
  alert_policy_condition_threshold = 0.5
  alert_policy_condition_duration = 60  # 60 Seconds
  alert_policy_condition_alignment_period = 60  # 60 Seconds
  alert_policy_condition_series_aligner = "ALIGN_RATE"

  alert_policy_condition_filter = <<-EOT
    resource.type = "cloud_run_revision" AND (
      resource.labels.location = "${var.region}" AND
      resource.labels.project_id = "${var.project_id}"
    ) AND 
    metric.type = "logging.googleapis.com/log_entry_count" AND
    metric.labels.severity = "ERROR"
  EOT
}


# Cloud Functions for Alert Policy Service
module "functions_alert_policy_service" {
  source = "./modules/functions"
  functions_name = "alert-policy-functions"
  functions_project_id = var.project_id
  functions_region = var.region
  
  functions_runtime = "go120"
  functions_description = <<-EOT
    cloud function alerting service for cloud run
    (Machine Learning Application)
  EOT

  storage_name = module.storage_alert_policy_service.bucket_name_output
  storage_zip_name = module.storage_alert_policy_service.bucket_zip_name_output

  functions_entrypoint = "DiscordAlerting"

  functions_event_type = "google.pubsub.topic.publish"
  functions_event_resource = module.pubsub_alert_policy_service.pubsub_topic_name
  functions_retry_policy = true

  functions_timeout = 60  # 60 Seconds
  functions_min_instance = 0
  functions_max_instance = 3
  functions_memory = 512  # 512 MB

  functions_envars = {
    DISCORD_BOT_NAME = var.discord_bot_name
    DISCORD_BOT_AVATAR = var.discord_bot_avatar

    # SECRET VALUES
    DISCORD_WEBHOOK_ID = var.discord_id
    DISCORD_WEBHOOK_TOKEN = var.discord_token

    DISCORD_TEAM_TAG = var.discord_team_tag
  }
}
