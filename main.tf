data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Windows Server 2022 Base"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["348016465244"]
}

resource "aws_vpc" var.vpc_terraform {
  cidr_block = 10.0.0.0/16
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.t3_micro

  tags = {
    Name = "Brian Terraform"
  }
}
