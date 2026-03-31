resource "aws_cloudwatch_metric_alarm" "cloudfront_5xx_alarm" {
  region              = "us-east-1"
  alarm_name          = "cloudfront-5xx-alarm"
  comparison_operator = "GreaterThanThreshold"
  # evaluation_periods  = 5
  evaluation_periods  = 1
  # metric_name         = "5xxErrorRate"
  metric_name         = "Requests"
  namespace           = "AWS/CloudFront"
  period              = 60
  statistic           = "Average"
  # threshold           = 5
  threshold           = 1
  treat_missing_data  = "notBreaching"
  alarm_description   = "This metric monitors cloudfront 5xx errors"

  dimensions = {
    DistributionId = aws_cloudfront_distribution.s3_distribution.id
    Region         = "Global"
  }

  alarm_actions             = [aws_sns_topic.error_notification_topic.arn]
  ok_actions                = [aws_sns_topic.error_notification_topic.arn]
  insufficient_data_actions = [aws_sns_topic.error_notification_topic.arn]
}

resource "aws_cloudwatch_metric_alarm" "lambda_edge_errors_alarm" {
  region              = "us-east-1"
  alarm_name          = "lambda-edge-errors-alarm"
  comparison_operator = "GreaterThanThreshold"
  # evaluation_periods  = 3
  evaluation_periods  = 1
  # metric_name         = "LambdaExecutionErrors"
  metric_name         = "Invocation"
  namespace           = "AWS/CloudFront"
  period              = 60
  statistic           = "Sum"
  # threshold           = 3
  threshold           = 1
  treat_missing_data  = "notBreaching"
  alarm_description   = "This metric monitors lambda errors"

  dimensions = {
    DistributionId = aws_cloudfront_distribution.s3_distribution.id
    Region         = "Global"
  }

  alarm_actions             = [aws_sns_topic.error_notification_topic.arn]
  ok_actions                = [aws_sns_topic.error_notification_topic.arn]
  insufficient_data_actions = [aws_sns_topic.error_notification_topic.arn]
}
