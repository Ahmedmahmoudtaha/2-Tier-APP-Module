
# Create 1 public subnet using the for_each meta-argument
resource "aws_subnet" "public" {
  for_each = var.public_subnet
  vpc_id            = data.aws_vpc.my_vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = "Public ${each.key} subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = data.aws_vpc.my_vpc.id

  tags = {
    Name = "Publicsubnet-gw"
  }
}

resource "aws_route_table" "public-RT" {
  vpc_id = data.aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-RT"
  }
}

resource "aws_route_table_association" "RT_assoc" {

  subnet_id =  aws_subnet.public["public-subnet"].id
  route_table_id = aws_route_table.public-RT.id
}




/* # Create 2 private subnets using the for_each meta-argument
resource "aws_subnet" "private" {
  for_each = var.private_subnets

  vpc_id            = data.aws_vpc.my_vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = "Private ${each.key} subnet"
  }
} */


