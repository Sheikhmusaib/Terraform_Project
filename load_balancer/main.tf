resource "aws_lb" "load_balancer" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_groups]
  subnets            = var.subnets
  idle_timeout       =  60 
  enable_cross_zone_load_balancing = true
  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = var.port
  protocol          = var.protocol

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Hello From Sheikh"
      status_code  = "200"
    }
  }
}

resource "aws_lb_target_group" "my_target_grp" {
  name     = "tf-example-lb-tg"
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id
}
resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.my_target_grp.arn
  target_id        = var.instance_id
  port             = var.port
}