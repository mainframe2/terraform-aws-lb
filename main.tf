######
# ELB
######
module "lb" {
  source = "./modules/lb"

  name        = var.name
  name_prefix = var.name_prefix

  subnets  = var.subnets
  internal = var.internal

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

  vpc_id = var.vpc_id

  number_of_instances = var.number_of_instances

  listener  = var.listener
  instances = var.instances

  load_balancer_arn     = module.lb.this_lb_arn
  enable_proxy_protocol = var.enable_proxy_protocol
}
