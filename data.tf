data "aws_vpc" "default" {
  default = true
}

data "aws_ami" "latest_amzn_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
}