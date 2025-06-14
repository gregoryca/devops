#!/bin/bash

echo -n "Enter the targeted host: "
read HOST

inventory="_inventory"

if [[ $HOST -eq "nextcloud" || $HOST -eq "proxmox" || $HOST -eq "pihole" || $HOST -eq "tailscale" || $HOST -eq "vps" ]] ; then
    hostName="$HOST$inventory"
    echo "The host we are targeting is:" $hostName
    echo "##vso[task.setvariable variable=HOST;isOutput=true]true"
fi