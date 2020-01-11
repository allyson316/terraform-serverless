resource "aws_iam_role" "bookings-stream-consumer-iam-role" {
  name               = "${var.environment}-bookings-stream-consumer-iam-role"
  assume_role_policy = templatefile("${path.module}/templates/lambda-base-policy.tpl", {})
}

resource "aws_ssm_parameter" "bookings-stream-consumer-iam-role" {
  name  = "${var.environment}-bookings-stream-consumer-iam-role"
  type  = "String"
  value = "${aws_iam_role.bookings-stream-consumer-iam-role.arn}"
}
