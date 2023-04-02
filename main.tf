terraform {
  required_version = "~> 1.0" 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  /*
  backend "s3" {
    bucket = "terraform-mylandmark"
    key    = "prod/terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "terraform-lock"
  }
  */
}



provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "actions" {
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "Class30"
    Team ="DevOps"
    Division="HR"
  }
}

resource "aws_instance" "bootcamp31" {
     #ami           = "ami-0e5b6b6a9f3db6db8" # Amazon Linux
     ami = data.aws_ami.ubuntu.id
     instance_type = var.instance_type[1]
     delete_on_termination = true

     tags = {
      Name = local.name
     }
    }

variable "instance_type" {
  description = "EC2 Instance Type"
  type = list(string)
  default = ["t2.micro", "t2.medium"]
}

output "public_ip" {
  description = "ec2 instance public ip"
  value = aws_instance.inst1.arn
}

locals {
    name = "${var.app_name}-${var.environment}"
  }
  
 data "aws_ami" "ubuntu" {
     most_recent = true
     owners = ["self"]

     filter {
      name = "name"
      value = ["packer-docker"]
     }
   } 
