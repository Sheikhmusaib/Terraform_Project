output "nat_eip" {
  value = aws_eip.nat_eip.public_ip
}

output "nat_gateway" {
  value = aws_nat_gateway.nat.id
}