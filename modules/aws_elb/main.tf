resource "aws_lb_target_group" "alb_tg" {
  name     = var.aws_lb_target_group_name
  port     = var.aws_lb_target_group_port
  protocol = var.aws_lb_target_group_protocol
  vpc_id   = var.aws_lb_target_group_vpc_id
}

resource "aws_lb_target_group_attachment" "alb_tg_attach_1" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = var.aws_lb_target_group_attachment_target_id_1
  port             = 80
}

resource "aws_lb_target_group_attachment" "alb_tg_attach_2" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = var.aws_lb_target_group_attachment_target_id_2
  port             = 80
}

resource "aws_lb" "alb" {
  name               = var.aws_lb_name
  internal           = var.aws_lb_internal
  load_balancer_type = var.aws_lb_load_balancer_type
  security_groups    = var.aws_lb_security_groups
  subnets            = var.aws_lb_subnets

  enable_deletion_protection = var.aws_lb_enable_deletion_protection

#   access_logs {
#     bucket  = var.aws_lb_access_logs_bucket
#     prefix  = var.aws_lb_access_logs_prefix
#     enabled = var.aws_lb_access_logs_enabled
#   }
  
  tags = var.aws_lb_tags

  depends_on = [aws_lb_target_group.alb_tg]
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}