resource "aws_lb_target_group" "this" {
  name              = var.name
  port              = var.port
  protocol          = var.protocol
  vpc_id            = var.vpc_id
  proxy_protocol_v2 = var.enable_proxy_protocol
}

resource "aws_lb_target_group_attachment" "this" {
  count            = var.number_of_instances
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = "${element(var.instances, count.index)}"
  port             = var.port
}

resource "aws_lb_listener" "this" {
  dynamic "listener" {
    for_each = var.listener
    content {
      load_balancer_arn = var.load_balancer_arn
      port              = listener.value.instance_port
      protocol          = listener.value.instance_protocol

      default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.this.arn
      }
    }
  }
}
