output "name" {
  description = "Name of the Docker container."
  value       = var.name
}

output "port_mappings" {
  description = "Port mappings of the Docker container."
  value       = var.port_mappings
}

output "definition" {
  description = "Container definition. `rendered` holds the definition as a JSON array string, ready for an ECS task definition's `container_definitions`."
  value = {
    rendered = local.definition
  }
}
