#!/bin/bash
echo "About to destroy Rancher 2.x install"

containers=$(docker ps -a | grep -E "rancher|k8s" | awk '{print $1}')
if [ "${containers}x" != "x" ]
then
  docker rm -f $containers
else
  echo "No containers - ignoring docker rm"
fi

images=$(docker images -a | grep -E "rancher|k8s" | awk '{print $3}')
if [ "${images}x" != "x" ]
then
  docker rmi $images
else
  echo "No images - ignoring docker rmi"
fi

docker volume prune -f


cleanupdirs="/var/lib/etcd /etc/kubernetes /etc/cni /opt/cni /var/lib/cni /var/run/calico /opt/rke"
for dir in $cleanupdirs; do
  echo "Removing $dir"
  rm -rf $dir
done
