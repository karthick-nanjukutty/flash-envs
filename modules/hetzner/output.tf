output "master_ip" {
  description = "Public IP address of the master node"
  value       = hcloud_server.master[0].ipv4_address
}

output "worker_ips" {
  description = "Public IP addresses of the worker nodes"
  value       = hcloud_server.worker[*].ipv4_address
}

output "kubeconfig" {
  description = "Kubeconfig for the K3s cluster"
  value       = null_resource.k3s_installer[0].id != "" ? file("${path.module}/kubeconfig") : ""
  sensitive   = true
}
