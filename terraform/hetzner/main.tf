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
  ssh_private_key_path = var.ssh_private_key_path
  master_count        = var.master_count
  worker_count        = var.worker_count
  location            = var.location
  master_type         = var.master_type
  worker_type         = var.worker_type
  cluster_name        = var.cluster_name
}

resource "null_resource" "wait_for_kubeconfig" {
  depends_on = [module.k3s_cluster]

  provisioner "local-exec" {
    command = "while [ ! -f ${path.module}/../../modules/hetzner/kubeconfig ]; do sleep 5; done"
  }
}
