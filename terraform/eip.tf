resource "aws_eip" "POI-EIP" {
  public_ipv4_pool = "amazon"

  depends_on = [
    aws_internet_gateway.POI-IGW
  ]
}