# Cluster/Orchestration Manager
# Set up on root@<IP_MACHINE_HERE>
# Levindo G. T. Neto
# Kubernetes version: v1.13.2
# Updated in January 2019

export MASTER_IP=<IP_MACHINE_HERE>
apt-get update && apt-get upgrade -y
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update -y
apt-get install -y docker.io
# Check the docker version
docker version
apt-get install -y kubelet kubeadm kubectl kubernetes-cni

# master config -> for using a virtual networking layer (flannel)
# Generate the certificates and token for adding nodes to this master later on
kubeadm init --pod-network-cidr=10.244.0.0/16  --apiserver-advertise-address $MASTER_IP

# Always needed
# If these commands are not run you'd get:
# 'The connection to the server localhost:8080 was refused
#  - did you specify the right host or port?'
cp /etc/kubernetes/admin.conf $HOME/
chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf

# Get Flannel
curl -sSL "https://github.com/coreos/flannel/blob/master/Documentation/kube-flannel.yml?raw=true" | kubectl --namespace=kube-system create -f -
