resource "aws_iam_policy_attachment" "bookings-stream-consumer-iam-policy-attachment" {
  name       = "${var.environment}-bookings-stream-consumer-iam-policy-attachment"
  roles      = ["${aws_iam_role.bookings-stream-consumer-iam-role.name}"]
  policy_arn = "${aws_iam_policy.bookings-stream-consumer-iam-policy.arn}"
}
