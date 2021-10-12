#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")"

# Loading Vundle
echo -e "\e[33mLoading Vundle...\e[0m"
vundle_directory="$HOME/.vim/bundle/Vundle.vim"
if [ -d $vundle_directory ]; then
  echo -e "Directory already exists\n"
else
  git clone https://github.com/VundleVim/Vundle.vim.git $vundle_directory

  echo -e "\e[32mSuccess\e[0m\n"
fi

# Creating backup
vimrc_file="$HOME/.vimrc"
if [ -e $vimrc_file ]; then
  echo -e "\e[33mCreating backup file (.vimrc.bak)...\e[0m"
  cp $HOME/.vimrc $HOME/.vimrc.bak
  echo -e "\e[32mSuccess\e[0m\n"
fi

# Copying template
echo -e "\e[33mInstall vimrc...\e[0m"
cp $DIR/vimrc $HOME/.vimrc
echo -e "\e[32mSuccess\e[0m\n"

# Instaliing plugins
echo -e "\e[33mInstall Plugins...\e[0m"
vim +PluginInstall +qall
echo -e "\e[32mSuccess\e[0m"
