#!/bin/sh
BASE_PATH="configs/nvim"

mkdir -p ~/.config/nvim
pip3 install --upgrade neovim

sed '/call plug#end/q' $BASE_PATH/init.vim > $BASE_PATH/temp.vim
nvim -u $BASE_PATH/temp.vim -c ':PlugInstall' -c ':qall'
rm $BASE_PATH/temp.vim
