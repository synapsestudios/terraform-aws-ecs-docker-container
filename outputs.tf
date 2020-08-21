output "name" {
  value = var.name
}

output "port_mappings" {
  value = var.port_mappings
}

output "definition" {
  value = data.template_file.definition
}
