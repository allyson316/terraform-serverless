resource "aws_iam_role" "login-iam-role" {
  name               = "${var.environment}-login-iam-role"
  assume_role_policy = templatefile("${path.module}/templates/lambda-base-policy.tpl", {})
}

resource "aws_ssm_parameter" "login-iam-role" {
  name  = "${var.environment}-login-iam-role"
  type  = "String"
  value = "${aws_iam_role.login-iam-role.arn}"
}

