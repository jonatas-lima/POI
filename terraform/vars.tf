variable "keypair_path" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "Localização da chave ssh no sistema de arquivos"
}

variable "ec2_config" {
  type = map(string)
  default = {
    "ami"           = "ami-0574da719dca65348"
    "instance_type" = "t2.medium"
  }
}
