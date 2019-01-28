#!/bin/zsh

res=$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F'"' '{ print $2}')

if [ $? -eq 0 ]; then
    echo "\uf0ac ${res}"
else
    echo '\uf071 No Internet Access'
fi
