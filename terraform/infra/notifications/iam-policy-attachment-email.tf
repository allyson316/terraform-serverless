resource "aws_iam_policy_attachment" "email-iam-policy-attachment" {
  name       = "${var.environment}-email-iam-policy-attachment"
  roles      = ["${aws_iam_role.email-iam-role.name}"]
  policy_arn = "${aws_iam_policy.email-iam-policy.arn}"
}
