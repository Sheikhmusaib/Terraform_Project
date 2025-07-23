resource "aws_security_group" "terrafrom_sg" {
  vpc_id      = var.vpc_id

  tags = {
    Name = "my_Sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "inbound_ipv4" {
  security_group_id = aws_security_group.terrafrom_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.from_port
  ip_protocol       = var.ip_protocol
  to_port           = var.to_port
}


resource "aws_vpc_security_group_egress_rule" "outbound_ipv4" {
  security_group_id = aws_security_group.terrafrom_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 
}
