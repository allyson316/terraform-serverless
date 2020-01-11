resource "aws_sns_topic" "notifications" {
  name = "${var.environment}-notifications"
}

resource "aws_ssm_parameter" "notifications-topic" {
  name  = "${var.environment}-notifications-topic"
  type  = "String"
  value = "${aws_sns_topic.notifications.arn}"
}

output "notifications-topic-arn" {
  value = "${aws_sns_topic.notifications.arn}"
}

