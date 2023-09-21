resource "aws_vpc" "terraform-vpc" {
    assign_generated_ipv6_cidr_block     = false
    cidr_block                           = "10.0.0.0/16"
    enable_dns_hostnames                 = true
    enable_dns_support                   = true
    enable_network_address_usage_metrics = false
    instance_tenancy                     = "default"
    tags                                 = {
        "Name" = "terraform-vpc"
    }
    tags_all                             = {
        "Name" = "terraform-vpc"
    }
}

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

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.t3_nano

  tags = {
    Name = "Brian Terraform"
  }
}
