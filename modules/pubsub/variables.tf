# Topic Name
variable "topic_name" {
    type = string
    default = "pubsub_messaging_topic"
    description = "Topic Name <type: String>"
}

# Subscription Name
variable "subscription_name" {
    type = string
    default = "pubsub_messaging_subscription"
    description = "Subscription Name <type: String>"
}

# Acknowledge Deadline
variable "ack_deadline" {
    type = number
    default = 10
    description = "Acknowledge Deadline (Seconds) <type: Number>"
}

# Message Retention
variable "message_retention" {
    type = number
    default = 60
    description = "Message Retention (Seconds) <type: String>"
}

# Expiration Policy TTL
variable "expiration_policy_ttl" {
    type = number
    default = 10
    description = "Expiration Policy TTL (Days) <type: Number>"
}

# Retry Policy
variable "retry_policy" {
    type = map(number)
    default = {
        minimum_backoff = 30
        maximum_backoff = 600
    }

    description = "Retry Policy (Seconds) <type: Map(Number)>"
}
