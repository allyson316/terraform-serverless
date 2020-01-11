resource "aws_iam_policy_attachment" "list-bookings-iam-policy-attachment" {
  name       = "${var.environment}-list-bookings-iam-policy-attachment"
  roles      = ["${aws_iam_role.list-bookings-iam-role.name}"]
  policy_arn = "${aws_iam_policy.list-bookings-iam-policy.arn}"
}
