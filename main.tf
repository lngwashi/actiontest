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