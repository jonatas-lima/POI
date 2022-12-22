data "aws_launch_template" "POI-EC2-TEMPLATE" {
  id = "lt-01b189806457a0f01"
}

resource "aws_instance" "POI-CONTROL-PLANE" {
  launch_template {
    id = data.aws_launch_template.POI-EC2-TEMPLATE.id
  }

  vpc_security_group_ids      = [aws_security_group.POI-SG.id]
  subnet_id                   = aws_subnet.POI-PUBLIC-SUBNET.id
  associate_public_ip_address = true
}

resource "aws_instance" "POI-WORKER" {
  launch_template {
    id = data.aws_launch_template.POI-EC2-TEMPLATE.id
  }

  count                       = 2
  vpc_security_group_ids      = [aws_security_group.POI-SG.id]
  subnet_id                   = aws_subnet.POI-PUBLIC-SUBNET.id
  associate_public_ip_address = true
}