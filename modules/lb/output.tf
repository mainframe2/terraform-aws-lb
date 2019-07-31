output "this_lb_arn" {
  description = "The ARN of the LB"
  value       = concat(aws_lb.this.*.arn, [""])[0]
}

output "this_lb_arn_suffix" {
  description = "The ARN of the LB"
  value       = concat(aws_lb.this.*.arn_suffix, [""])[0]
}

output "this_lb_id" {
  description = "The name of the LB"
  value       = concat(aws_lb.this.*.id, [""])[0]
}

output "this_lb_name" {
  description = "The name of the LB"
  value       = concat(aws_lb.this.*.name, [""])[0]
}

output "this_lb_dns_name" {
  description = "The DNS name of the LB"
  value       = concat(aws_lb.this.*.dns_name, [""])[0]
}

output "this_lb_zone_id" {
  description = "The canonical hosted zone ID of the LB (to be used in a Route 53 Alias record)"
  value       = concat(aws_lb.this.*.zone_id, [""])[0]
}
