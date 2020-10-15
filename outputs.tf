output "arn" {
  value       = aws_cloudformation_stack.sns-topic.outputs["ARN"]
  description = "Email SNS topic ARN"
}

output "topic" {
  value       = aws_cloudformation_stack.sns-topic.outputs["TopicName"]
  description = "Email SNS topic name"
}

output "alert_arn" {
  value       = aws_cloudformation_stack.sns-topic-alert.outputs["ARN"]
  description = "Email alert SNS topic ARN"
}
output "alert_arn" {
  value       = aws_cloudformation_stack.sns-topic-alert.outputs["TopicName"]
  description = "Email alert SNS topic name"
}
