#!/bin/sh
path='/root/Pictures/solarized_wallpaper'
wallpaper=$(ls ${path} -1 | shuf -n 1)
wallpaper=solarized-wallpaper-linuxmasterrace.png
feh --bg-fill "${path}/${wallpaper}"
sed -e '4d;6,8d' /root/.dotfiles/configs/i3/random_wallpaper.sh > /tmp/random_wallpaper.sh
chmod +x /tmp/random_wallpaper.sh
mv /tmp/random_wallpaper.sh /root/.dotfiles/configs/i3/random_wallpaper.sh
