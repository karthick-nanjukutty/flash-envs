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

variable "master_count" {
  description = "Number of master nodes"
  type        = number
  default     = 1
}

variable "worker_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 1
}

variable "master_type" {
  description = "Server type for master nodes"
  type        = string
}

variable "worker_type" {
  description = "Server type for worker nodes"
  type        = string
}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key"
  type        = string
}

# Add any other variables that are in your terraform.tfvars file but not declared here
