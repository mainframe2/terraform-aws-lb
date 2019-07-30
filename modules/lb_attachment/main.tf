locals {
  attachments_total_count = var.number_of_instances * length(var.listener)
  listeners_total_count   = length(var.listener)
  total_instances         = length(var.instances)
}

resource "aws_lb_target_group" "this" {
  count    = local.listeners_total_count
  name     = "${var.name}-${count.index}"
  port     = element(var.listener, count.index)["instance_port"]
  protocol = element(var.listener, count.index)["instance_protocol"]

  health_check {
    protocol            = "TCP"
    interval            = 10
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  vpc_id            = var.vpc_id
  proxy_protocol_v2 = var.enable_proxy_protocol
}

resource "aws_lb_target_group_attachment" "this" {
  count            = local.attachments_total_count
  target_group_arn = element(aws_lb_target_group.this.*.arn, floor(count.index / local.total_instances))
  target_id        = "${element(var.instances, count.index % local.total_instances)}"
  port             = "${element(var.listener, floor(count.index / local.total_instances))["instance_port"]}"
}

resource "aws_lb_listener" "this" {
  count             = local.listeners_total_count
  load_balancer_arn = var.load_balancer_arn
  port              = element(var.listener, count.index)["instance_port"]
  protocol          = element(var.listener, count.index)["instance_protocol"]

  default_action {
    type             = "forward"
    target_group_arn = element(aws_lb_target_group.this.*.arn, count.index)
  }
}
