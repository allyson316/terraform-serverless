resource "aws_iam_policy" "bookings-stream-consumer-iam-policy" {
  name = "${var.environment}-bookings-stream-consumer-iam-policy"

  policy = templatefile("${path.module}/templates/dynamodb-policy.tpl", {
    action = join("\",\"", [
      "dynamodb:DescribeStream",
      "dynamodb:GetRecords",
      "dynamodb:GetShardIterator",
      "dynamodb:ListStreams",
    ]),
    resource  = "${aws_dynamodb_table.bookings.stream_arn}",
    sns_topic = "${var.sns_notifications_arn}"
  })
}
