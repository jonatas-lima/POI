resource "aws_instance" "POI-CONTROL-PLANE" {
  launch_template {
    id = aws_launch_template.POI-EC2-TEMPLATE.id
  }

  tags = {
    "Name" = "CONTROL-PLANE"
  }
}

resource "aws_instance" "POI-WORKER" {
  launch_template {
    id = aws_launch_template.POI-EC2-TEMPLATE.id
  }

  count = 2

  tags = {
    "Name" = "WORKER-${count.index}"
  }
}