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
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "lfs260" {
  key_name   = "lfs260"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCtLs2rdJy50y/3dETI5awTLuJji8Bq3+bd3SCBe2FkQhAZw7S70nd99VeYeqMt3hSqJ2C8kqZwcgllAN/pOAgxDF3U9TJtfsKYhUp19a/pg3NIFiv7u6LSg21MsbsmR4+TWd9BNBiW1QAzDiLfEcUSd5h5L1E9EV0UkNdtkFWK2dZfBJCqCCk3qRWWb2E2oPKnsIq6hBTwW6PVtdHuVHXQb07PxP5kLnAmwR4UdRUUe0g+ypmSluEEKHZiKjZUmV6URpqOAum2Z4/nQqALjBiNlX4HvWjgvfbFLa9eShhH0s2EVy0f/VyewaHmL18BcVVQpNdaKwfxXn+14DkA+Add WeiJen For WH gitlab"
}


