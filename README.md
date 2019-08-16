# terraform-aws-lb
Terraform AWS Network Load Balancer

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| enable_deletion_protection | Enable/Disable deletion protection | bool | false | no |
| enable_proxy_protocol | Enable/Disable Proxy Protocol | bool | true | no |
| idle\_timeout | The time in seconds that the connection is allowed to be idle | number | `3600` | no |
| instances | List of instances ID to place in the ELB pool | list(string) | `[]` | no |
| internal | If true, ELB will be an internal ELB | string | n/a | yes |
| name | The name of the ELB | string | `null` | yes |
| number\_of\_instances | Number of instances to attach to ELB | number | `1` | no |
| security\_groups | A list of security group IDs to assign to the ELB | list(string) | n/a | yes |
| subnets | A list of subnet IDs to attach to the ELB | list(string) | n/a | yes |
| vpc_id | ID of VPC where you want to deploy NLB | string | n/a | yes |


## Authors

Module managed by Frame Systems Team
