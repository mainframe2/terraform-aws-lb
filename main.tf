######
# ELB
######
module "lb" {
  source = "./modules/lb"

  name        = var.name
  name_prefix = var.name_prefix

  subnets         = var.subnets
  security_groups = var.security_groups
  internal        = var.internal

  # TODO cross_zone_load_balancing  = var.cross_zone_load_balancing
  idle_timeout               = var.idle_timeout
  enable_deletion_protection = var.enable_deletion_protection

  tags = merge(
    var.tags,
    {
      "Name" = format("%s", var.name)
    },
  )
}

#################
# ELB attachment
#################
module "lb_attachment" {
  source = "./modules/lb_attachment"

  name = var.name

  port     = var.port
  protocol = var.protocol

  listener_port     = var.listener_port
  listener_protocol = var.listener_protocol

  target_id = var.target_id
  vpc_id    = var.vpc_id

  load_balancer_arn     = module.lb.arn
  enable_proxy_protocol = var.enable_proxy_protocol
}
