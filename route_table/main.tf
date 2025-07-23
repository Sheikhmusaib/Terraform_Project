resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block =  var.pub_rtbl_cidr_Block
    gateway_id = var.internet_gateway_id
  }
    tags = {
    Name = "my_pub_rtbl"
  }
}

resource "aws_route_table_association" "public_association" {
  subnet_id      = var.pub_subnet_id
  route_table_id = aws_route_table.public_route_table.id
}

#=========================================================================
resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block =  var.prvt_rtbl_cidr_Block
    nat_gateway_id  = var.nat_gateway_id
  }
    tags = {
    Name = "my_privt_rtbl"
  }
}

resource "aws_route_table_association" "private_association" {
  subnet_id      = var.prvt_subnet_id
  route_table_id = aws_route_table.private_route_table.id
}
 
