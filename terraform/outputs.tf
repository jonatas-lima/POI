output "control-plane-public-ip" {
  value = aws_instance.POI-CONTROL-PLANE.public_ip
}

output "control-plane-private-ip" {
  value = aws_instance.POI-CONTROL-PLANE.private_ip
}

output "worker-public-ip" {
  value = {
    for k, instance in aws_instance.POI-WORKER : k => instance.public_ip
  }
}

output "worker-private-ip" {
  value = {
    for k, instance in aws_instance.POI-WORKER : k => instance.private_ip
  }
}