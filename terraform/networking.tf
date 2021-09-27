terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
  shared_credentials_file=var.AWS_CREDS_FILE_PATH
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = var.azs
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway  = false
  reuse_nat_ips      = true
  external_nat_ip_ids = "${aws_eip.nat.*.id}"
  one_nat_gateway_per_az = true

  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

# To use same Elastic IP's each time VPC is destroyed.
resource "aws_eip" "nat" {
  count = 3

  vpc = true
}


