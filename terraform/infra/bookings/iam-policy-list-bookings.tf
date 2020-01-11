resource "aws_iam_policy" "list-bookings-iam-policy" {
  name = "${var.environment}-list-bookings-iam-policy"

  policy = templatefile("${path.module}/templates/dynamodb-policy.tpl", {
    action    = "dynamodb:Scan",
    resource  = "${aws_dynamodb_table.bookings.arn}",
    sns_topic = ""
  })
}
