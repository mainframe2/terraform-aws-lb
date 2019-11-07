resource "aws_lb" "this" {
  name        = var.name
  name_prefix = var.name_prefix

  internal           = var.internal
  load_balancer_type = "network"
  subnets            = var.internal ? var.subnets : null

  # TODO cross_zone_load_balancing  = var.cross_zone_load_balancing
  idle_timeout               = var.idle_timeout
  enable_deletion_protection = var.enable_deletion_protection

  dynamic "subnet_mapping" {
    for_each = var.internal ? {} : var.subnet_mapping
    content {
      subnet_id     = subnet_mapping.key
      allocation_id = subnet_mapping.value
    }
  }

  # TODO Tags require 'name', using 'name_prefix' is impossible
  tags = merge(
    var.tags,
    {
      "Name" = format("%s", var.name)
    },
  )
}
