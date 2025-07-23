output "pub_subnet_id" {
  value = aws_subnet.public_subnet.id
}
output "privt_subnet_id" {
  value = aws_subnet.private_subnet.id
}

