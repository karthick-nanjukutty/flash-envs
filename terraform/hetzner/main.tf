terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.35.0"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

module "k3s_cluster" {
  source = "../../modules/hetzner"

  hcloud_token        = var.hcloud_token
  ssh_key_fingerprint = var.ssh_key_fingerprint
  master_count        = 1
  worker_count        = 1
  location            = var.location
  master_type         = var.server_type
  worker_type         = var.server_type
  cluster_name        = var.cluster_name
}

output "master_ip" {
  description = "Public IP address of the master node"
  value       = module.k3s_cluster.master_ip
}

output "worker_ips" {
  description = "Public IP addresses of the worker nodes"
  value       = module.k3s_cluster.worker_ips
}
