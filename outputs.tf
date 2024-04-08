output "private_subnet_ids" {
  value = aws_subnet.private_subnet[*].id 
  description = "List of private subnet id's"
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
  description = "List of public subnet ids"
}

output "vpc_id" {
    value = aws_vpc.project_vpc.id
    description = "VPC ID"
}

output "private_route_id" {
    value = aws_route_table.private.id
    description = "Private route table ID"
}

output "public_route_id" {
    value = aws_route_table.public.id
    description = "Public route table ID"
}

output "igw_id" {
  value = aws_internet_gateway.project_igw.id
  description = "Internet gateway ID"
}