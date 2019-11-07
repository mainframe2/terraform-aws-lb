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

  subnet_mapping = var.internal ? null : zipmap(var.subnets, aws_eip.this[*].id)

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

  vpc_id = var.vpc_id

  number_of_instances = var.number_of_instances

  listener  = var.listener
  instances = var.instances

  load_balancer_arn = module.lb.this_lb_arn
}

resource "aws_eip" "this" {
  count = var.internal ? null : length(var.subnets)
  vpc   = true

  tags = merge(
    var.tags,
    {
      "Name" = format("%s", var.name)
    },
  )
}
