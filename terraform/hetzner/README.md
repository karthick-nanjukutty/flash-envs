# Hetzner K3s Cluster Terraform Module

This Terraform module deploys a K3s cluster on Hetzner Cloud. It creates a simple Kubernetes cluster with one master node and one worker node, suitable for development or small-scale deployments.

## Features

- Deploys a K3s cluster on Hetzner Cloud
- Configurable node types and locations
- Automatic SSH key management
- Easy to scale worker nodes

## Usage

1. Ensure you have the Hetzner Cloud API token and your SSH key fingerprint.

2. Create a `terraform.tfvars` file with the following content:
   ```hcl
   hcloud_token         = "your_hetzner_cloud_api_token"
   ssh_key_fingerprint  = "your_ssh_key_fingerprint"
   cluster_name         = "k3s-demo"
   server_type          = "cx11"
   location             = "nbg1"   ```

3. Initialize Terraform:
   ```
   terraform init   ```

4. Apply the Terraform configuration:
   ```
   terraform apply   ```

5. After successful application, you can access your cluster using the master node's IP address:
   ```
   ssh root@<master_ip> -i ~/.ssh/id_ed25519   ```

## Variables

- `hcloud_token`: Hetzner Cloud API Token (required)
- `ssh_key_fingerprint`: Fingerprint of the SSH key to use (required)
- `cluster_name`: Name of the K3s cluster (default: "k3s-demo")
- `server_type`: Hetzner Cloud server type (default: "cx11")
- `location`: Hetzner Cloud datacenter location (default: "nbg1")

## Outputs

- `master_ip`: Public IP address of the master node
- `worker_ips`: List of public IP addresses of the worker nodes

## Note

This module is intended for demonstration and development purposes. For production use, consider adding more security measures and customizing the configuration to meet your specific requirements.
