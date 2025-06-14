terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
  }

  backend "s3" {
    bucket         = "sushil-terraform-bucket14566" // to store the state file in S3 to avoid local state
    key            = "terraform/terraform.tfstate"
    region         = "us-east-1"
    # dynamodb_table = "terraform-lock-table"  // for state locking
  }
}

provider "aws" {
  region = var.default_region
}

resource "aws_instance" "my-ec2-instance" {
    count = 2
    ami           = var.ami_id 
    instance_type = var.default_instance_type
    
    tags = {
        Name = "MyEC2Server"
    }
}

