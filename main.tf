module "vpc" {
  source = "./vpc"
  vpc_cidr_block = var.vpc_cidr_block
}

module "subnet" {
  source = "./subnet"
  vpc_id = module.vpc.vpc_id
  pub_subnet_cidr_block = var.pub_subnet_cidr_block
  pub_availability_zone = var.pub_availability_zone
  privt_subnet_cidr_block = var.privt_subnet_cidr_block
  privt_availability_zone = var.privt_availability_zone
}

module "aws_internet_gateway" {
  source = "./igw"
  vpc_id = module.vpc.vpc_id
}

module "nat" {
  source = "./nat_gateway"
  pub_subnet_id = module.subnet.pub_subnet_id
}

module "route_table" {
  source = "./route_table"
  vpc_id = module.vpc.vpc_id
  pub_rtbl_cidr_Block = var.pub_rtbl_cidr_Block
  internet_gateway_id = module.aws_internet_gateway.igw_id
  pub_subnet_id = module.subnet.pub_subnet_id
  prvt_rtbl_cidr_Block= var.prvt_rtbl_cidr_Block
  nat_gateway_id= module.nat.nat_gateway
  prvt_subnet_id=module.subnet.privt_subnet_id
}

module "ec2_instance" {
  source = "./ec2_instance"
  ami_id = var.ami_id
  instance_type = var.instance_type
  prvt_subnet_id = module.subnet.privt_subnet_id
  vpc_security_group_ids  = module.security_group.security_group_id
}

module "security_group" {
  source ="./security_group"
  vpc_id= module.vpc.vpc_id
  from_port = var.from_port
  to_port = var.to_port
  ip_protocol = var.ip_protocol
}

module "load_balancer" {
  source = "./load_balancer"
  security_groups= module.security_group.security_group_id
  subnets            = [module.subnet.privt_subnet_id,module.subnet.pub_subnet_id]
  instance_id = module.ec2_instance.instance_id
  vpc_id = module.vpc.vpc_id
  protocol = var.protocol
  port = var.port
  





}