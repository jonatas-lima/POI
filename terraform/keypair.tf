resource "aws_key_pair" "POI-KEYPAIR" {
  key_name   = "POI-KEYPAIR"
  public_key = file("${var.keypair_path}")
}