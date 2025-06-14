#!/bin/bash

echo -n "Enter the targeted host: "
read HOST

if [[ $HOST -eq "nextcloud" || $HOST -eq "proxmox" || $HOST -eq "pihole" || $HOST -eq "tailscale" || $HOST -eq "vps" ]]
then
  echo "The host we are targeting is:" $HOST
  echo "##vso[task.setvariable variable=HOST;isOutput=true]true"
fi