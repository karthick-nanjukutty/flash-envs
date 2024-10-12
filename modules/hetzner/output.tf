output "master_ip" {
  description = "Public IP address of the master node"
  value       = hcloud_server.master[0].ipv4_address
}

output "worker_ips" {
  description = "Public IP addresses of the worker nodes"
  value       = hcloud_server.worker[*].ipv4_address
}

output "k3s_token" {
  description = "K3s token"
  value       = random_password.k3s_token.result
  sensitive   = true
}

