########
# Locals
########
locals {
  log_configuration = {
    logDriver     = "awslogs"
    secretOptions = null,
    options = {
      awslogs-group         = "/${var.environment_name}/application/${var.name}"
      awslogs-region        = data.aws_region.current.name
      awslogs-stream-prefix = "ecs"
    }
  }

  # Produces JSON dictionary
  env_variables = [for key in keys(var.env_variables) :
    {
      name  = key
      value = lookup(var.env_variables, key)
    }
  ]
  secrets = [for key in keys(var.secrets) :
  {
    name  = key
    value = lookup(var.secrets, key)
  }
  ]
}

######################
# AWS - Current Region
######################
data "aws_region" "current" {}

############################
# Docker Definition Template
############################
# The following format functions below are a
# workaround for: https://github.com/hashicorp/terraform/issues/23062#issuecomment-581261163
data "template_file" "definition" {
  template = file("${path.module}/definitions/template.json")
  vars = {
    name               = jsonencode(var.name)
    image              = jsonencode(var.image)
    cpu                = jsonencode(var.cpu)
    memory             = jsonencode(var.memory)
    essential          = jsonencode(var.essential)
    dns_search_domains = var.dns_search_domains == null ? format("%v", var.dns_search_domains) : jsonencode(var.dns_search_domains)
    log_configuration  = var.log_configuration == null ? jsonencode(local.log_configuration) : jsonencode(var.log_configuration)
    entrypoint         = var.entrypoint == null ? format("%v", var.entrypoint) : jsonencode(var.entrypoint)
    command            = var.command == null ? format("%v", var.command) : jsonencode(var.command)
    port_mappings      = jsonencode(var.port_mappings)
    env_variables      = jsonencode(local.env_variables)
    labels             = jsonencode(var.labels)
    secrets            = jsonencode(local.secrets)
  }
}
