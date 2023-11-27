data "google_billing_account" "billing_account" {
    billing_account = var.billing_account
}

data "google_project" "project" {
    project_id = var.project_id
}

resource "google_billing_budget" "budget" {
    display_name = var.billing_name
    billing_account = data.google_billing_account.billing_account.id

    budget_filter {
        calendar_period = "MONTH"
        projects = ["projects/${data.google_project.project.number}"]
        credit_types_treatment = "INCLUDE_SPECIFIED_CREDITS"
        services = ["*"]
        credit_types = ["PROMOTION", "FREE_TIER"]
    }

    amount {
        specified_amount {
            units = "30"
            currency_code = "USD"
        }
    }


    # Threshold: 60 %
    threshold_rules {
        threshold_percent = 0.6
        spend_basis = "CURRENT_SPEND"
    }

    threshold_rules {
        threshold_percent = 0.6
        spend_basis = "FORECASTED_SPEND"
    }


    # Threshold: 70 %
    threshold_rules {
        threshold_percent = 0.7
        spend_basis = "CURRENT_SPEND"
    }

    threshold_rules {
        threshold_percent = 0.7
        spend_basis = "FORECASTED_SPEND"
    }


    # Threshold: 80 %
    threshold_rules {
        threshold_percent = 0.8
        spend_basis = "CURRENT_SPEND"
    }

    threshold_rules {
        threshold_percent = 0.8
        spend_basis = "FORECASTED_SPEND"
    }


    # Threshold: 90 %
    threshold_rules {
        threshold_percent = 0.9
        spend_basis = "CURRENT_SPEND"
    }

    threshold_rules {
        threshold_percent = 0.9
        spend_basis = "FORECASTED_SPEND"
    }


    # Threshold: 95 %
    threshold_rules {
        threshold_percent = 0.95
        spend_basis = "CURRENT_SPEND"
    }

    threshold_rules {
        threshold_percent = 0.95
        spend_basis = "FORECASTED_SPEND"
    }


    # Threshold: 100 %
    threshold_rules {
        threshold_percent = 1.0
        spend_basis = "CURRENT_SPEND"
    }

    threshold_rules {
        threshold_percent = 1.0
        spend_basis = "FORECASTED_SPEND"
    }

    all_updates_rule {
        pubsub_topic = "projects/${
            var.project_id
        }/topics/${
            var.pubsub_topic_id
        }"
    }
}