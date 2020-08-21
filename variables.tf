variable "name" {
  type        = string
  description = "Name of Docker container."
}

variable "environment_name" {
  type        = string
  description = "Name of environment."
}

variable "image" {
  type        = string
  description = "Docker image (ECR Repo URI) for this container."
}

variable "entrypoint" {
  type        = list(string)
  description = "Entrypoint of the Docker container."
  default     = null
}

variable "command" {
  type        = list(string)
  description = "Command of the Docker container."
  default     = null
}

variable "env_variables" {
  type        = map(string)
  description = "(Optional) A key value pair mapping of environment variables for the Docker container."
  default     = {}
}

variable "port_mappings" {
  type        = list(object({ hostPort = number, containerPort = number, protocol = string }))
  description = "(Optional) A key value pair mapping of ports for the Docker container."
  default     = []
}

variable "log_configuration" {
  type        = object({ logDriver = string, secretOptions = any, options = map(string) })
  description = "(Optional) A key value pair mapping for the Docker log configuration."
  default     = null
}

variable "dns_search_domains" {
  type        = string
  description = "DNS Search domains to use for the Docker container."
  default     = null
}

variable "cpu" {
  type        = number
  description = "CPU shares to assign to the Docker container."
}

variable "memory" {
  type        = number
  description = "Memory in MegaBytes to assign to the Docker container."
}

variable "essential" {
  type        = bool
  description = "If the essential parameter of a container is marked as true, the failure of that container will stop the task."
  default     = true
}

variable "labels" {
  type        = map(string)
  description = "(Optional) A key valie pair mapping for Docker labels."
  default     = {}
}
