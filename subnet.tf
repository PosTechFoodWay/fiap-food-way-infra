resource "aws_vpc" "custom_vpc" {
  # Your VPC must have DNS hostname and DNS resolution support. 
  # Otherwise, your worker nodes cannot register with your cluster. 

  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnet_cidr_blocks)

  vpc_id     = aws_vpc.custom_vpc.id
  cidr_block = var.public_subnet_cidr_blocks[count.index]

  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "PublicSubnet${count.index + 1}"
  }
}
