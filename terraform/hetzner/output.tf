output "kubeconfig" {
  description = "Kubeconfig for the K3s cluster"
  value       = module.k3s_cluster.kubeconfig
  sensitive   = true
  depends_on  = [null_resource.wait_for_kubeconfig]
}

output "master_ip" {
  description = "Public IP address of the master node"
  value       = module.k3s_cluster.master_ip
}

output "worker_ips" {
  description = "Public IP addresses of the worker nodes"
  value       = module.k3s_cluster.worker_ips
}
