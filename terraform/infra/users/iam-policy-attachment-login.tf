resource "aws_iam_policy_attachment" "login-iam-policy-attachment" {
  name       = "${var.environment}-login-iam-policy-attachment"
  roles      = ["${aws_iam_role.login-iam-role.name}"]
  policy_arn = "${aws_iam_policy.login-iam-policy.arn}"
}
