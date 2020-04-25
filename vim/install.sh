#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")"

echo "Load Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Copy vimrc"
cp $DIR/vimrc $HOME/.vimrc

echo "Install Plugins"
vim +PluginInstall +qall
