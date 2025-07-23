resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.prvt_subnet_id
  associate_public_ip_address = false
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  

  user_data = <<EOF
#!/bin/bash
apt update -y
apt install apache2 -y
systemctl start apache2
cd /var/www/html
echo "<html><h1>Hello Cloud Sheikh Welcome To My Webpage</h1></html>" > index.html
EOF

  tags = {
    Name = "My_terraform_server"
  }
}