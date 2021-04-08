data "aws_vpc" "main" {
  default = true
}

resource "aws_eip" "ip_master" {
  instance = aws_instance.master.id
  vpc      = true
}

resource "aws_eip" "ip_workre" {
  instance = aws_instance.worker.id
  vpc      = true
}