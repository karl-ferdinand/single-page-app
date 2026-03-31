resource "aws_sns_topic" "error_notification_topic" {
  region = "us-east-1"
  name   = var.topic_name
}

resource "aws_sns_topic_subscription" "error_notification_subscription" {
  region    = "us-east-1"
  topic_arn = aws_sns_topic.error_notification_topic.arn
  protocol  = "email"
  endpoint  = var.notification_email
}
