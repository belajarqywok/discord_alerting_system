# Cloud Storage / Bucket for Budget Alert Service
module "storage_budget_alert_service" {
  source = "./modules/storage"

  storage_name = "budget-alert-service"
  storage_region = var.region
  storage_project_id = var.project_id

  source_directory = "./services/budget_service/"

  archive_file_excludes = [
    ".mvn",
    "run.bat",
    ".vscode",
    "target",
    "wrapper",
    "Makefile",
    "mvnw",
    "mvnw.cmd",
    ".gitignore",
    "install_manual.sh",
    "budget-service.zip"
  ]
}


# Pub/Sub for Budget Alert Service
module "pubsub_budget_alert_service" {
  source = "./modules/pubsub"

  # Topic
  topic_name = "budget-alerting-topic"

  subscription_name = "budget-alerting-subscription"
  ack_deadline = 10 # 10 Seconds
  message_retention = 604800  # 7 Days
  expiration_policy_ttl = 31  # 31 Days

  retry_policy = {
    minimum_backoff = 10  # 10 Seconds
    maximum_backoff = 600  # 600 Seconds
  }
}


# Billing Budget Alert
# module "billing_budget_alert_service" {
#   source = "./modules/billing"
#   project_id = var.project_id

#   billing_name = "docpet-billing-name"
#   billing_account = "000000-111111-222222"

#   pubsub_topic_id = module.pubsub_budget_alert_service.pubsub_topic_id
# }


# Cloud Functions for Budget ALert Service
module "functions_budget_alert_service" {
  source = "./modules/functions"
  functions_name = "budget-alert-functions"
  functions_project_id = var.project_id
  functions_region = var.region
  
  functions_runtime = "java11"
  functions_description = "budget alerting"

  storage_name = module.storage_budget_alert_service.bucket_name_output
  storage_zip_name = module.storage_budget_alert_service.bucket_zip_name_output

  functions_entrypoint = "com.BudgetService.BudgetServiceApplication"

  functions_event_type = "google.pubsub.topic.publish"
  functions_event_resource = module.pubsub_budget_alert_service.pubsub_topic_name
  functions_retry_policy = true

  functions_timeout = 60  # 60 Seconds
  functions_min_instance = 0
  functions_max_instance = 3
  functions_memory = 1024  # 1024 MB

  functions_envars = {
    DISCORD_BOT_NAME = var.discord_bot_name
    DISCORD_BOT_AVATAR = var.discord_bot_avatar

    # SECRET VALUES
    DISCORD_WEBHOOK_ID = var.discord_id
    DISCORD_WEBHOOK_TOKEN = var.discord_token

    DISCORD_TEAM_TAG = var.discord_team_tag
  }
}
