resource "aws_lb" "POI-LB" {
  name               = "POI-LB"
  internal           = false
  load_balancer_type = "network"
  subnets            = [aws_subnet.POI-PUBLIC-SUBNET.id]
}

resource "aws_lb_listener" "POI-LB-LISTENER" {
  load_balancer_arn = aws_lb.POI-LB.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.POI-LB-TG.arn
  }
}

resource "aws_lb_target_group" "POI-LB-TG" {
  name     = "POI-LB-TG"
  port     = 80
  protocol = "TCP"
  vpc_id   = aws_vpc.POI-VPC.id

  depends_on = [
    aws_lb.POI-LB
  ]
}

resource "aws_lb_target_group_attachment" "POI-LB-ATTACHMENT-WORKERS" {
  count            = 2
  target_group_arn = aws_lb_target_group.POI-LB-TG.arn
  target_id        = aws_instance.POI-WORKER[count.index].id
}