output "loadbalancer_name" {
  value       = azurerm_lb.basic_lb.name
  description = "The name of the basic load balancer."
}

output "loadbalancer_public_ip_address" {
  value       = azurerm_public_ip.lb_public_ip.ip_address
  description = "The public IP address of the basic load balancer."
}

