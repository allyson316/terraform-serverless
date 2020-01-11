resource "aws_iam_policy_attachment" "create-booking-iam-policy-attachment" {
  name       = "${var.environment}-create-booking-iam-policy-attachment"
  roles      = ["${aws_iam_role.create-booking-iam-role.name}"]
  policy_arn = "${aws_iam_policy.create-booking-iam-policy.arn}"
}
