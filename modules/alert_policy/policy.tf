resource "google_monitoring_notification_channel" "pubsub_channel" {
    display_name = var.notification_channel_name
    type  = "pubsub"

    labels = {
        topic = "projects/${
            var.policy_project_id
        }/topics/${
            var.pubsub_topic_name
        }"
    }
}

resource "google_monitoring_alert_policy" "logging_alert" {
    display_name = var.alert_policy_name
    combiner = var.alert_policy_combiner

    conditions {
        display_name = var.alert_policy_condition_name

        condition_threshold {
            filter = var.alert_policy_condition_filter
            comparison = var.alert_policy_condition_comparison
            threshold_value = var.alert_policy_condition_threshold
            duration = "${
                var.alert_policy_condition_duration
            }s"

            aggregations {
                alignment_period = "${
                    var.alert_policy_condition_alignment_period
                }s"

                per_series_aligner = var.alert_policy_condition_series_aligner
            }
        }
    }

    notification_channels = [
        google_monitoring_notification_channel.pubsub_channel.id
    ]
}
