apiVersion: v1
clusters:
- cluster:
    server: https://${master_ip}:6443
    certificate-authority-data: ${k3s_token}
  name: default
contexts:
- context:
    cluster: default
    user: default
  name: default
current-context: default
kind: Config
preferences: {}
users:
- name: default
  user:
    client-certificate-data: ${k3s_token}
    client-key-data: ${k3s_token}
