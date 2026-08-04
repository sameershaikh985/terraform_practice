#example creating a VPC

terraform{
  required_providers{
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"	
    }
  }	
}

#configure the provider
provider "aws" {
  region = "ap-south-1"
}

#create a VPC
resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"
}
