# Pub/Sub Topic Name
output "pubsub_topic_name" {
    value = google_pubsub_topic.alerting_topic.name
}

# Pub/Sub Topic ID
output "pubsub_topic_id" {
    value = google_pubsub_topic.alerting_topic.id
}

# Pub/Sub Subcription Name
output "pubsub_subscription_name" {
    value = google_pubsub_subscription.alerting_sub.name
}

# Pub/Sub Subcription ID
output "pubsub_subscription_id" {
    value = google_pubsub_subscription.alerting_sub.id
}
