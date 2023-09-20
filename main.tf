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

import {
  to = aws_vpc.terraform_vpc
  id = "vpc-017882a3fcce1c41c"
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.t3_micro

  tags = {
    Name = "Brian Terraform"
  }
}
