# (only needed when using Node Driver/Templates)
# sudo firewall-cmd --zone=public --add-port=2376/tcp --permanent

# etcd client requests
sudo firewall-cmd --zone=public --add-port=2379/tcp --permanent

# etcd peer communication
sudo firewall-cmd --zone=public --add-port=2380/tcp --permanent

# Canal/Flannel VXLAN overlay networking
sudo firewall-cmd --zone=public --add-port=8472/udp --permanent

# Canal/Flannel, livenessProbe/readinessProbe
sudo firewall-cmd --zone=public --add-port=9099/tcp --permanent

# kubelet
sudo firewall-cmd --zone=public --add-port=10250/tcp --permanent

sudo firewall-cmd --reload
