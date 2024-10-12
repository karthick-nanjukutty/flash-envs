#!/bin/bash
echo "${ssh_key}" >> /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
curl -sfL https://get.k3s.io | K3S_URL=https://${master_ip}:6443 K3S_TOKEN=${k3s_token} sh -
