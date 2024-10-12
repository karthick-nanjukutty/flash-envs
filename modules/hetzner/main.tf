terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.35.0"
    }
  }
}

data "hcloud_ssh_key" "k3s_key" {
  fingerprint = var.ssh_key_fingerprint
}

data "hcloud_network" "k3s_network" {
  name = "k3s-network"
}

data "hcloud_image" "ubuntu" {
  name = "ubuntu-20.04"
  with_selector = "os-flavor=ubuntu"
  most_recent = true
}

resource "hcloud_server" "master" {
  count       = var.master_count
  name        = "${var.cluster_name}-master-${count.index + 1}"
  server_type = var.master_type
  image       = data.hcloud_image.ubuntu.id
  location    = var.location

  ssh_keys = [data.hcloud_ssh_key.k3s_key.id]

  network {
    network_id = data.hcloud_network.k3s_network.id
  }

  user_data = templatefile("${path.module}/templates/master_user_data.tpl", {
    k3s_token = random_password.k3s_token.result,
    ssh_key   = data.hcloud_ssh_key.k3s_key.public_key
  })
}

resource "hcloud_server" "worker" {
  count       = var.worker_count
  name        = "${var.cluster_name}-worker-${count.index + 1}"
  server_type = var.worker_type
  image       = data.hcloud_image.ubuntu.id
  location    = var.location

  ssh_keys = [data.hcloud_ssh_key.k3s_key.id]

  network {
    network_id = data.hcloud_network.k3s_network.id
  }

  user_data = templatefile("${path.module}/templates/worker_user_data.tpl", {
    k3s_token  = random_password.k3s_token.result,
    master_ip  = hcloud_server.master[0].ipv4_address,
    ssh_key    = data.hcloud_ssh_key.k3s_key.public_key
  })

  depends_on = [hcloud_server.master]
}

resource "random_password" "k3s_token" {
  length  = 32
  special = false
}
