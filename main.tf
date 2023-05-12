# Configure the AWS Provider
provider "aws" {
  version = "~> 4.0"
  region  = "us-east-1"
}

resource "aws_vpc" "actions" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Class30" 
  }
}
