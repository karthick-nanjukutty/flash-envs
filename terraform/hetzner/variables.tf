variable "hcloud_token" {
  description = "Hetzner Cloud API Token"
  type        = string
  sensitive   = true
}

variable "ssh_key_fingerprint" {
  description = "Fingerprint of the SSH key"
  type        = string
}

variable "location" {
  description = "Hetzner Cloud datacenter location"
  type        = string
}

variable "server_type" {
  description = "Hetzner Cloud server type"
  type        = string
}

variable "cluster_name" {
  description = "Name of the K3s cluster"
  type        = string
}

# Add any other variables that are in your terraform.tfvars file but not declared here
