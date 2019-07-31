resource "aws_lb_target_group" "this" {
  name              = var.listener["name"]
  port              = var.listener["instance_port"]
  protocol          = var.listener["instance_protocol"]
  vpc_id            = var.vpc_id
  proxy_protocol_v2 = var.enable_proxy_protocol
}

resource "aws_lb_target_group_attachment" "this" {
  count            = var.number_of_instances
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = "${element(var.instances, count.index)}"
  port             = var.listener["instance_port"]
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = var.load_balancer_arn
  port              = var.listener["instance_port"]
  protocol          = var.listener["instance_protocol"]

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}
