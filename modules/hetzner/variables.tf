variable "hcloud_token" {
  description = "Hetzner Cloud API Token"
  type        = string
}

variable "location" {
  description = "The datacenter to deploy to"
  type        = string
  default     = "nbg1"
}

variable "server_type" {
  description = "The server type to deploy"
  type        = string
  default     = "cpx11"
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
  type        = string
  default     = "skip-connect"
}

variable "master_count" {
  description = "Number of master nodes"
  type        = number
  default     = 1
}

variable "master_type" {
  description = "Server type for master nodes"
  type        = string
  default     = "cpx11"
}

variable "worker_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 1
}

variable "worker_type" {
  description = "Server type for worker nodes"
  type        = string
  default     = "cpx11"
}

variable "ssh_key_fingerprint" {
  description = "SSH key fingerprint"
  type        = string
}

# variable "pr_number" {
#   description = "Pull Request number for creating a dynamic namespace"
#   type        = string
# }

variable "ssh_private_key_path" {
  description = "Path to the SSH private key"
  type        = string
}
