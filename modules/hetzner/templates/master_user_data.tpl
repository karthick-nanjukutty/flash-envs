#!/bin/bash
echo "${ssh_key}" >> /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --token=${k3s_token}" sh -
