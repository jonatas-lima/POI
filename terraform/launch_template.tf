resource "aws_launch_template" "POI-EC2-TEMPLATE" {
  name          = "POI-EC2-LAUNCH-TEMPLATE"
  image_id      = lookup(var.ec2_config, "ami")
  instance_type = lookup(var.ec2_config, "instance_type")
  key_name      = aws_key_pair.POI-KEYPAIR.key_name

  monitoring {
    enabled = true
  }

  network_interfaces {
    subnet_id                   = aws_subnet.POI-PUBLIC-SUBNET.id
    associate_public_ip_address = true
    security_groups             = [aws_security_group.POI-SG.id]
  }

  tags = {
    "Name" = "POI-EC2-TEMPLATE"
  }
}