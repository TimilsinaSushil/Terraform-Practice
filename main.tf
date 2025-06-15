terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
  }

  backend "s3" {
    bucket = "sushil-terraform-bucket14566" // to store the state file in S3 to avoid local state
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
    # dynamodb_table = "terraform-lock-table"  // for state locking
  }
}

provider "aws" {
  region = var.default_region
}

resource "aws_instance" "my-ec2-instance" {
  count         = 1
  ami           = var.ami_id
  instance_type = var.default_instance_type
  key_name      = "sushil_june14"
  tags = {
    Name = "MyEC2Server"
  }


  # File provisioners examples

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/sushil_june14.pem")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "conf/myapp.config"
    destination = "/home/ubuntu/myapp.config"

  }

  provisioner "file" {
    source      = "conf/myapache.sh"
    destination = "/home/ubuntu/myapache.sh"

  }

  //local-exec to run commands on the local machine after the instance is created

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> information.txt"

  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> information.txt"

  }

  // remote-exec to run commands on the remote machine after the instance is created


  # provisioner "remote-exec" {
  #         inline = [
  #             "sudo apt update -y",
  #             "sudo apt install -y nginx",
  #             "sudo systemctl start nginx",
  #             "sudo systemctl enable nginx"
  #         ]
  #     }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/myapache.sh",
      "sudo /home/ubuntu/myapache.sh"
    ]

  }


}

