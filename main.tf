## Locals

locals {
  default_tags = {
    "Terraform"        = "true"
    "Terraform-Module" = "deanwilson-sns-email"
  }
}

data "template_file" "cloudformation_sns_stack" {
  template = file("${path.module}/templates/email-sns-stack.json.tpl")

  vars = {
    display_name  = var.display_name
    email_address = var.email_address
    protocol      = var.protocol
  }
}

data "template_file" "cloudformation_sns_stack_alert" {
  template = file("${path.module}/templates/email-sns-stack.json.tpl")

  vars = {
    display_name  = var.display_name
    email_address = var.alert_email_address
    protocol      = var.protocol
  }
}

resource "aws_cloudformation_stack" "sns-topic" {
  name          = var.stack_name
  template_body = data.template_file.cloudformation_sns_stack.rendered

  tags = merge(
    local.default_tags,
    var.additional_tags,
    {
      "Name" = var.stack_name
    },
  )
}

resource "aws_cloudformation_stack" "sns-topic-alert" {
  name          = "${var.stack_name}-monitoring"
  template_body = data.template_file.cloudformation_sns_stack_alert.rendered

  tags = merge(
    local.default_tags,
    var.additional_tags,
    {
      "Name" = var.stack_name
    },
  )
}
