resource "aws_sns_topic" "topic" {
  name = var.topic_name
}

resource "aws_sns_topic_subscription" "subscription" {
  for_each = var.subscribers
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "sms"
  endpoint  = each.value
}

resource "aws_sns_topic_policy" "policy" {
  arn = aws_sns_topic.topic.arn
  policy = data.aws_iam_policy_document.document.json
}

data "aws_iam_policy_document" "document" {
  policy_id = var.topic_name

  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      aws_sns_topic.topic.arn,
    ]

    sid = var.topic_name
  }
}


