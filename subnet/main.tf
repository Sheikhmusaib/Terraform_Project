resource "aws_subnet" "public_subnet" {
  vpc_id            = var.vpc_id
  cidr_block = var.pub_subnet_cidr_block
  availability_zone = var.pub_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "My_pub_Subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = var.vpc_id
  cidr_block = var.privt_subnet_cidr_block
  availability_zone = var.privt_availability_zone
  
  tags = {
    Name = "My_privt_Subnet"
  }
}