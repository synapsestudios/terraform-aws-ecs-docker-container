# AWS ECS Docker Container

This module creates an AWS ECS compatible Docker container definition for use with [synapsestudios/terraform-aws-ecs-deployment](https://github.com/synapsestudios/terraform-aws-ecs-deployment). This module has a many to one relationship with the ecs-deployment. This mean each deployment can have multiple containers and port mappings, useful for sidecar deployment scenarios.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.29 |
| aws | ~> 2.53 |
| template | ~> 2.1 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.53 |
| template | ~> 2.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cpu | CPU shares to assign to the Docker container. | `number` | n/a | yes |
| environment\_name | Name of environment. | `string` | n/a | yes |
| image | Docker image (ECR Repo URI) for this container. | `string` | n/a | yes |
| memory | Memory in MegaBytes to assign to the Docker container. | `number` | n/a | yes |
| name | Name of Docker container. | `string` | n/a | yes |
| command | Command of the Docker container. | `list(string)` | `null` | no |
| dns\_search\_domains | DNS Search domains to use for the Docker container. | `string` | `null` | no |
| entrypoint | Entrypoint of the Docker container. | `list(string)` | `null` | no |
| env\_variables | (Optional) A key value pair mapping of environment variables for the Docker container. | `map(string)` | `{}` | no |
| essential | If the essential parameter of a container is marked as true, the failure of that container will stop the task. | `bool` | `true` | no |
| labels | (Optional) A key valie pair mapping for Docker labels. | `map(string)` | `{}` | no |
| log\_configuration | (Optional) A key value pair mapping for the Docker log configuration. | `object({ logDriver = string, secretOptions = any, options = map(string) })` | `null` | no |
| port\_mappings | (Optional) A key value pair mapping of ports for the Docker container. | `list(object({ hostPort = number, containerPort = number, protocol = string }))` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| definition | n/a |
| name | n/a |
| port\_mappings | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->