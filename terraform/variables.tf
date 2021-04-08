variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "root_ebs_size" {
  type    = number
  default = 10
}

variable "availability_zone" {
  type    = string
  default = "eu-west-2b"
}