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

<<<<<<< HEAD
  tags   = {
    Name = "Brian Test"
=======
  tags = {
    Name = "Brian Terraform 12345"
>>>>>>> b861bdb69373596df9de051ab107df25449875a8
  }
}
