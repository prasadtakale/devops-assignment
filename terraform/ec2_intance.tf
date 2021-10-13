resource "aws_instance" "python_flask_ec2" {
  ami                    = "ami-03ab7423a204da002"
  instance_type          = "t2.micro"
  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["sg-061803a2c147b9ecf"]
  key_name = "prasad-aws"
  count = 2
  tags = {
    Name = "python_flask_ec2"
  }
}