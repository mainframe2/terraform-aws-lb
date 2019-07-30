output "this_lb_id" {
  description = "The name of the LB"
  value       = module.lb.this_lb_id
}

output "this_lb_arn" {
  description = "The ARN of the LB"
  value       = module.lb.this_lb_arn
}

output "this_lb_arn_suffix" {
  description = "The ARN of the LB"
  value       = module.lb.this_lb_arn_suffix
}

output "this_lb_name" {
  description = "The name of the LB"
  value       = module.lb.this_lb_name
}

output "this_lb_dns_name" {
  description = "The DNS name of the LB"
  value       = module.lb.this_lb_dns_name
}

output "this_lb_instances" {
  description = "The list of instances in the LB"
  value       = module.lb.this_lb_instances
}

output "this_lb_source_security_group_id" {
  description = "The ID of the security group that you can use as part of your inbound rules for your load balancer's back-end application instances"
  value       = module.lb.this_lb_source_security_group_id
}

output "this_lb_zone_id" {
  description = "The canonical hosted zone ID of the LB (to be used in a Route 53 Alias record)"
  value       = module.lb.this_lb_zone_id
}
