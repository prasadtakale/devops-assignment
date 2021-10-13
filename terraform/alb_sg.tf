resource "aws_security_group" "allow_http" {
  name        = "allow-http"
  description = "Allow http inbound traffic for alb"
  vpc_id      = "${var.vpc_id}"

  ingress = [
    {
      description      = "http"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = [ "183.87.113.115/32", "172.31.0.0/16" ]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false
    },
        {
      description      = "flask-alb"
      from_port        = 5000
      to_port          = 5000
      protocol         = "tcp"
      cidr_blocks      = [ "183.87.113.115/32", "172.31.0.0/16" ]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]
  egress =[
    {
      description      = "All_traffic"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = [ "183.87.113.115/32", "172.31.0.0/16" ]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]

  tags = {
    Name = "http_in"
  }

}
output "security_group_id" {
    value = "alb_sg"
}