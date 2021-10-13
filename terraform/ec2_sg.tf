resource "aws_security_group" "allow_ssh" {
  name        = "ec2-ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = "${var.vpc_id}"

  ingress = [
    {
      description      = "SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [ "183.87.113.115/32", "172.31.0.0/16" ]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false
    },
        {
      description      = "flask"
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
    Name = "ssh_in"
  }
}