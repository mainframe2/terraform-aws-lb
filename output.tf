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

output "this_lb_zone_id" {
  description = "The canonical hosted zone ID of the LB (to be used in a Route 53 Alias record)"
  value       = module.lb.this_lb_zone_id
}
