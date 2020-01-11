resource "aws_iam_role" "register-iam-role" {
  name               = "${var.environment}-register-iam-role"
  assume_role_policy = templatefile("${path.module}/templates/lambda-base-policy.tpl", {})
}

resource "aws_ssm_parameter" "register-iam-role" {
  name  = "${var.environment}-register-iam-role"
  type  = "String"
  value = "${aws_iam_role.register-iam-role.arn}"
}

