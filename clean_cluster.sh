#!/bin/sh

if [ $(id -u) -ne 0 ]; then
  echo "Must be run as root!"
  exit
fi

docker container kill $(docker ps -q)
docker container rm $(docker ps -a -q)
# docker system prune -a -f
sudo rm -rf /etc/kubernetes/
docker ps -a

DLIST="/var/lib/etcd /etc/kubernetes /etc/cni /opt/cni /var/lib/cni /var/run/calico /opt/rke"
for dir in $DLIST; do
  echo "Removing $dir"
  rm -rf $dir
done
