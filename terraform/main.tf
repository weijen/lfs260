terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "root_ebs_size" {
  type    = number
  default = 10
}

resource "aws_instance" "master" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = "Master"
  }

  vpc_security_group_ids = [aws_security_group.allow_all.id]

  root_block_device {
    volume_size           = var.root_ebs_size
    delete_on_termination = true
  }
}

resource "aws_instance" "worker" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = "Worker"
  }

  vpc_security_group_ids = [aws_security_group.allow_all.id]

  root_block_device {
    volume_size           = var.root_ebs_size
    delete_on_termination = true
  }
}

data "aws_vpc" "main" {
  default = true
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow All inbound traffic"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    description = "All from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }
}
