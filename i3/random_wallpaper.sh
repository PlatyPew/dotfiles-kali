#!/bin/sh
path='/root/Pictures/solarized_wallpaper'
wallpaper=$(ls ${path} -1 | shuf -n 1)
feh --bg-fill "${path}/${wallpaper}"
