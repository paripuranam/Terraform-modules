resource "aws_lb" "lb-1" {
  name = "${var.asg_name}-lb-1"
  load_balancer_type = "application"
  subnets = data.aws_subnets.my_subnets.ids #
  security_groups = [aws_security_group.my.id]
}

resource "aws_lb_listener" "my_lb_listener_HTTP" {
  load_balancer_arn = aws_lb.lb-1.arn
  port = local.http_port
  protocol = "HTTP"
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Not found!"
      status_code = 404
    }
  }
}

resource "aws_lb_listener" "my_lb_listener_1" {
  load_balancer_arn = aws_lb.lb-1.arn
  port = local.port_2
  protocol = "HTTP"
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Not Found raaa!!!"
      status_code = 404
    }
}
}

resource "aws_lb_listener" "my_lb_listener_2" {
  load_balancer_arn = aws_lb.lb-1.arn
  port = local.custom_port
  protocol = "HTTP"
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Not found ra kanna!!"
      status_code = 404
    }
  }
}

resource "aws_lb_target_group" "target" {
  name = "${var.asg_name}-target-group"
  port = local.custom_port
  protocol = "HTTP"
  vpc_id = data.aws_vpc.my_vpc.id

  health_check {
    path = "/"
    protocol = "HTTP"
    matcher = 200
    interval = 15
    timeout = 3
    unhealthy_threshold = 5
    healthy_threshold = 5
  }
}

resource "aws_lb_listener_rule" "asg" {
  listener_arn = aws_lb_listener.my_lb_listener_2.arn
  priority     = 100

  condition {
    path_pattern {
      values = ["*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target.arn
  }
}