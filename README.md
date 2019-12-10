# AWS Network Load Balancer (NLB) Terraform module

Terraform module which creates NLB resources on AWS.

Root module calls these modules which can also be used separately to create independent resources:

* [lb](https://github.com/mainframe2/terraform-aws-lb/tree/master/modules/lb) - creates NLB
* [lb_attachment](https://github.com/mainframe2/terraform-aws-lb/tree/master/modules/lb_attachment) - creates NLB attachments, target groups, etc.

## Terraform versions

Terraform 0.12

## Input Arguments

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| enable_deletion_protection | Enable/Disable deletion protection | bool | false | no |
| enable_proxy_protocol | Enable/Disable Proxy Protocol | bool | true | no |
| idle\_timeout | The time in seconds that the connection is allowed to be idle | number | `3600` | no |
| instances | List of instances ID to place in the NLB pool | list(string) | `[]` | no |
| internal | If true, NLB will be an internal NLB | string | true | yes |
| name | The name of the NLB | string | `null` | yes |
| number\_of\_instances | Number of instances to attach to NLB | number | `1` | no |
| security\_groups | A list of security group IDs to assign to the NLB | list(string) | n/a | yes |
| subnets | A list of subnet IDs to attach to the NLB | list(string) | n/a | yes |
| vpc_id | ID of VPC where you want to deploy NLB | string | n/a | yes |

## Output Attributes

| Name | Description |
|------|-------------|
| this_lb_id | NLB AWS ID |
| this_lb_arn | NLB AWS ARN |
| this_lb_arn_suffix | NLB ARN Suffix |
| this_lb_name | The name of the load balancer |
| this_lb_dns_name | AWS assigned DNS name |
| this_lb_zone_id | ID of hosted zones |
| this_lb_public_ip | NLB Public IP (EIP) - empty when internal/private |

## Authors

Module managed by Stefan Mihajlovic
