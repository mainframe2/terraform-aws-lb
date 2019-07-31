locals {
  total_count_attachments = var.number_of_instances * length(var.listener)
  total_count_listeners   = length(var.listener)
}

resource "aws_lb_target_group" "this" {
  count    = local.total_count_listeners
  name     = "${var.name}-${count.index}"
  port     = element(var.listener, count.index)["instance_port"]
  protocol = element(var.listener, count.index)["instance_protocol"]

  health_check = {
    interval            = 5
    protocol            = TCP
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  vpc_id            = var.vpc_id
  proxy_protocol_v2 = var.enable_proxy_protocol
}

resource "aws_lb_target_group_attachment" "this" {
  count            = local.total_count_attachments
  target_group_arn = element(aws_lb_target_group.this.*.arn, floor("${count.index / local.total_count_listeners}"))
  target_id        = "${element(var.instances, count.index % length(var.instances))}"
  port             = "${element(var.listener, floor(count.index / length(var.instances)))["instance_port"]}"
}

resource "aws_lb_listener" "this" {
  count             = local.total_count_listeners
  load_balancer_arn = var.load_balancer_arn
  port              = element(var.listener, count.index)["instance_port"]
  protocol          = element(var.listener, count.index)["instance_protocol"]

  default_action {
    type             = "forward"
    target_group_arn = element(aws_lb_target_group.this.*.arn, count.index)
  }
}
