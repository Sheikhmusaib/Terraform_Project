resource "aws_eip" "nat_eip" {
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.pub_subnet_id

  tags = {
    Name = "gw NAT"
  }
}