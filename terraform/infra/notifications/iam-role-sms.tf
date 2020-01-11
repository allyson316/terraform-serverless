resource "aws_iam_role" "sms-iam-role" {
  name               = "${var.environment}-sms-iam-role"
  assume_role_policy = templatefile("${path.module}/templates/lambda-base-policy.tpl", {})
}

resource "aws_ssm_parameter" "sms-iam-role" {
  name  = "${var.environment}-sms-iam-role"
  type  = "String"
  value = "${aws_iam_role.sms-iam-role.arn}"
}
