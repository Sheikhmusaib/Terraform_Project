
##############public_Subnet################################
variable "vpc_cidr_block" {
   type        = string
}

variable "pub_subnet_cidr_block" {
   type = string
}

variable "pub_availability_zone" {
     type = string
}
#######private_Subnet#######################################
variable "privt_subnet_cidr_block" {
   type = string
}
variable "privt_availability_zone" {
   type = string
}

#############nat###############################
variable "pub_subnet_id" {
   type = string
}
variable "prvt_subnet_id" {
   type = string
}
variable "pub_rtbl_cidr_Block" {
   type = string
}
variable "prvt_rtbl_cidr_Block" {
   type = string
}
variable "nat_gateway_id" {
   type = string
}
variable "internet_gateway_id" {
   type = string
}

################################
variable "ami_id"{
   type = string
}
variable "instance_type" {
   type = string
}
############################################

variable  "from_port" {
    type = number
}
variable "to_port" {
    type = number
}
variable "ip_protocol" {
    type = string
}
variable "vpc_security_group_ids" {}
variable "subnets" {
  type = list(string)
}
variable "protocol" {}
variable "port" {}
variable "instance_id"{}
variable "security_groups" {}