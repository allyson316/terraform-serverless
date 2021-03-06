resource "aws_iam_role" "create-booking-iam-role" {
  name               = "${var.environment}-create-booking-iam-role"
  assume_role_policy = templatefile("${path.module}/templates/lambda-base-policy.tpl", {})
}

resource "aws_ssm_parameter" "create-booking-iam-role" {
  name  = "${var.environment}-create-booking-iam-role"
  type  = "String"
  value = "${aws_iam_role.create-booking-iam-role.arn}"
}

