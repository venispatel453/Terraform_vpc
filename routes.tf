# Creating Public route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.project_vpc.id
  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project_igw.id
  }
  tags = {
    Name = "${var.environment}-public-route-table"
  }
}

# Creating Private route table
resource "aws_route_table" "private" {
    vpc_id = aws_vpc.project_vpc.id
    tags = {
        Name = "${var.environment}-private-route-table"
    }
}

# Associating public subnet with public route table
resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr_blocks)
  route_table_id = aws_route_table.public.id
  subnet_id = aws_subnet.public_subnet[count.index].id
}

# Associating private subnet with private route table
resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidr_blocks)
  route_table_id = aws_route_table.private.id
  subnet_id = aws_subnet.private_subnet[count.index].id
}