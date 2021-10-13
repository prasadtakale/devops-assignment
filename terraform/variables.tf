provider "aws" {
  region = "us-west-1"
}

locals {
  domain_name = "terraform-aws-modules.modules.tf"
}


variable "ec2_sg" {
  description = "The security groups to attach to EC2 intance"
  type        = list(string)
  default     = ["sg-061803a2c147b9ecf"]
}

variable "alb_sg" {
  description = "The security groups to attach to Application LB"
  type        = list(string)
  default     = ["sg-03b9dee6dc08beb0f"]
}

variable "subnet_id" {
    description = "Subnet id for resources"
    type = string
    default = "subnet-f5008693"
  
}


variable "subnet_id2" {
    description = "Subnet id for resources"
    type = string
    default = "subnet-02e1c4818344de66c"
  
}


variable "target_groups" {
  description = "A list of maps containing key/value pairs that define the target groups to be created. Order of these maps is important and the index of these are to be referenced in listener definitions. Required key/values: name, backend_protocol, backend_port"
  type        = any
  default     = []
}

variable "vpc_id" {
  description = "VPC id where the load balancer and other resources will be deployed."
  type        = string
  default     = "vpc-2517c043"
}