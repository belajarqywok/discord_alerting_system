resource "google_pubsub_topic" "alerting_topic" {
    name = var.topic_name

    labels = {
        type  = "topic"
        event = "alerting"
    }
}

resource "google_pubsub_subscription" "alerting_sub" {
    name = var.subscription_name
    topic = google_pubsub_topic.alerting_topic.name

    ack_deadline_seconds = var.ack_deadline
    message_retention_duration = "${
        var.message_retention
    }s"

    expiration_policy {
        # ttl = "2678400s"
        ttl = "${
            60 * 60 * 24 * var.expiration_policy_ttl
        }s"
    }

    retry_policy {
        minimum_backoff = "${
            var.retry_policy["minimum_backoff"]
        }s"

        maximum_backoff = "${
            var.retry_policy["maximum_backoff"]
        }s"
    }
}
