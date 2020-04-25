#!/bin/bash

echo "Load Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Copy vimrc"
cp vimrc $HOME/.vimrc

echo "Install Plugins"
vim +PluginInstall +qall
