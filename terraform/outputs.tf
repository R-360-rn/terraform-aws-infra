output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
  #value        = aws_vpc.my-vpc.id
}

