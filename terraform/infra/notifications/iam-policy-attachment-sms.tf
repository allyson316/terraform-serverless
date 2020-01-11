resource "aws_iam_policy_attachment" "sms-iam-policy-attachment" {
  name       = "${var.environment}-sms-iam-policy-attachment"
  roles      = ["${aws_iam_role.sms-iam-role.name}"]
  policy_arn = "${aws_iam_policy.sms-iam-policy.arn}"
}
