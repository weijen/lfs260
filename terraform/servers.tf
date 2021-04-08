resource "aws_instance" "master" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = "Master"
  }

  key_name = aws_key_pair.lfs260.key_name

  vpc_security_group_ids = [aws_security_group.allow_all.id]
  subnet_id              = aws_subnet.lfs260.id

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

  key_name = aws_key_pair.lfs260.key_name

  vpc_security_group_ids = [aws_security_group.allow_all.id]
  subnet_id              = aws_subnet.lfs260.id

  root_block_device {
    volume_size           = var.root_ebs_size
    delete_on_termination = true
  }
}