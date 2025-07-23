output "load_balancer_dns" {
  value       = module.load_balancer.load_balancer_dns_name
}

output "ec2_instance_public_ip" {
  value = module.ec2_instance.public_ip
}
