resource "aws_subnet" "private_subnet" {
    # counting how many cidr blocks we have, in each cidr block there will be one private subnet
    count = length(var.private_subnet_cidr_blocks)
    vpc_id = aws_vpc.project_vpc.id
    cidr_block = var.private_subnet_cidr_blocks[count.index]
    availability_zone = var.availability_zone[count.index]
    tags = merge(
        {
            Name = "${var.environment}-private-${var.availability_zone[count.index]}"
        },
        var.private_subnet_tags
    )
}

resource "aws_subnet" "public_subnet" {
    count = length(var.public_subnet_cidr_blocks)
    vpc_id = aws_vpc.project_vpc.id
    cidr_block = var.public_subnet_cidr_blocks[count.index]
    availability_zone = var.availability_zone[count.index]
    tags = merge(
        {
            Name = "${var.environment}-public-${var.availability_zone[count.index]}"
        },
        var.public_subnet_tags
    )
}