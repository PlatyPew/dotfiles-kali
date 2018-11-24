#!/bin/zsh
NetInterface='eth0'

ip=$(ifconfig $NetInterface | grep 'inet' | cut -d: -f2 | awk '{print $2}')

if [ $? -eq 0 ]; then
    echo -e "\uf817 ${ip}"
else
    echo "\uf818 ${NetInterface} inactive"
fi
