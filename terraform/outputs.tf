output "control-plane-public-ip" {
  value = aws_instance.POI-CONTROL-PLANE.public_ip
}

output "control-plane-private-ip" {
  value = aws_instance.POI-CONTROL-PLANE.private_ip
}

output "worker-public-ip" {
  value = aws_instance.POI-WORKER.*.public_ip
}

output "worker-private-ip" {
  value = aws_instance.POI-WORKER.*.private_ip
}

output "lb-address" {
  value = aws_eip.POI-EIP.public_ip
}

output "pod-subnet-cidr" {
  value = aws_subnet.POI-PUBLIC-SUBNET.cidr_block
}