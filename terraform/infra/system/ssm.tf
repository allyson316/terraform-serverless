resource "aws_ssm_parameter" "email_from" {
  name  = "${var.environment}-email_from"
  type  = "String"
  value = "${var.email_from}"
}

resource "aws_ssm_parameter" "email_from_password" {
  name  = "${var.environment}-email_from_password"
  type  = "String"
  value = "${var.email_from_password}"
}

resource "aws_ssm_parameter" "email_to" {
  name  = "${var.environment}-email_to"
  type  = "String"
  value = "${var.email_to}"
}

resource "aws_ssm_parameter" "smtp_server" {
  name  = "${var.environment}-smtp_server"
  type  = "String"
  value = "${var.smtp_server}"
}

resource "aws_ssm_parameter" "message_bird_api_key" {
  name  = "${var.environment}-message_bird_api_key"
  type  = "String"
  value = "${var.message_bird_api_key}"
}

resource "aws_ssm_parameter" "sms_phone_from" {
  name  = "${var.environment}-sms_phone_from"
  type  = "String"
  value = "${var.sms_phone_from}"
}
resource "aws_ssm_parameter" "sms_phone_to" {
  name  = "${var.environment}-sms_phone_to"
  type  = "String"
  value = "${var.sms_phone_to}"
}
