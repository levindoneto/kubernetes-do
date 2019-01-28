# Cluster/Orchestration Manager
# Set up of a Node on root@<IP_MACHINE_HERE>
# Levindo G. T. Neto
# Kubernetes version: v1.13.2
# Updated in January 2019

apt-get update && apt-get upgrade -y
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update -y
apt-get install -y docker.io kubelet kubeadm kubectl kubernetes-cni

kubeadm reset # Used in case you had already connected the node to another master

# Join to the created master (this command is given at the master at the end of the setup, just copy it and paste it below
kubeadm join <IP_MACHINE_HERE>:6443 --token <GENEREATED_TOKEN_1> --discovery-token-ca-cert-hash sha256:49<GENEREATED_TOKEN_2>
