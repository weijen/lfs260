resource "aws_subnet" "lfs260" {
  cidr_block        = cidrsubnet(data.aws_vpc.main.cidr_block, 3, 1)
  vpc_id            = data.aws_vpc.main.id
  availability_zone = var.availability_zone
}