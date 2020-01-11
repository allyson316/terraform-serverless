resource "aws_iam_policy_attachment" "register-iam-policy-attachment" {
  name       = "${var.environment}-register-iam-policy-attachment"
  roles      = ["${aws_iam_role.register-iam-role.name}"]
  policy_arn = "${aws_iam_policy.register-iam-policy.arn}"
}
