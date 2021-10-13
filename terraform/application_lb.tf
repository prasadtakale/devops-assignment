resource "aws_lb" "python_flask_alb" {
  name               = "python-flask-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = "${var.alb_sg}"
  subnets            = ["${var.subnet_id}", "${var.subnet_id2}"]
  
 tags = {
    Environment = "Testing"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.python_flask_alb.arn
  port              = "5000"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.python_flask_tg.arn}"
  }
}

resource "aws_lb_target_group" "python_flask_tg" {
    health_check {
      interval = 10
      path = "/"
      protocol = "HTTP"
      timeout = 5
      healthy_threshold = 5
      unhealthy_threshold = 2
    }
    name = "python-flask-tg"
    port = 5000
    protocol = "HTTP"
    target_type = "instance"
    vpc_id = "${var.vpc_id}"
}

resource "aws_lb_listener" "python_flask_listener" {
    load_balancer_arn = "${aws_lb.python_flask_alb.arn}"
    port = 5000
    protocol = "HTTP"
    default_action {
      target_group_arn = "${aws_lb_target_group.python_flask_tg.arn}"
      type = "forward"
    }
}

resource "aws_alb_target_group_attachment" "python_flask_tg_attach" {
    count = length(aws_instance.python_flask_ec2)
  target_group_arn = aws_lb_target_group.python_flask_tg.arn
  target_id = aws_instance.python_flask_ec2[count.index].id
  port = 5000
}