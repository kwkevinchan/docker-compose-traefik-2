# Ingress controller (HTTP)
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent

# Ingress controller (HTTPS)
sudo firewall-cmd --zone=public --add-port=443/tcp --permanent

# (only needed when using Node Driver/Templates)
# sudo firewall-cmd --zone=public --add-port=2376/tcp --permanent

# Kubernetes apiserver
sudo firewall-cmd --zone=public --add-port=6443/tcp --permanent

# Canal/Flannel VXLAN overlay networking
sudo firewall-cmd --zone=public --add-port=8472/udp --permanent

# Canal/Flannel, livenessProbe/readinessProbe
sudo firewall-cmd --zone=public --add-port=9099/tcp --permanent

# kubelet
sudo firewall-cmd --zone=public --add-port=10250/tcp --permanent

# Ingress controller, livenessProbe/readinessProbe
sudo firewall-cmd --zone=public --add-port=10254/tcp --permanent

# NodePort port range
sudo firewall-cmd --zone=public --add-port=30000-32767/udp --permanent
sudo firewall-cmd --zone=public --add-port=30000-32767/tcp --permanent

sudo firewall-cmd --reload
