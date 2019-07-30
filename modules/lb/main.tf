resource "aws_lb" "this" {
  name        = var.name
  name_prefix = var.name_prefix

  internal           = var.internal
  load_balancer_type = "network"
  subnets            = var.subnets

  security_groups = var.security_groups

  # TODO cross_zone_load_balancing  = var.cross_zone_load_balancing
  idle_timeout               = var.idle_timeout
  enable_deletion_protection = var.enable_deletion_protection

  # TODO Tags require 'name', using 'name_prefix' is impossible
  tags = merge(
    var.tags,
    {
      "Name" = format("%s", var.name)
    },
  )
}
