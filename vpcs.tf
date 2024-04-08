resource "aws_vpc" "project_vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"
  tags = {
    name = "${var.environment}-vpc"
  }
}