#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")"

# Loading plugins
echo -e "\e[33mLoading plugins...\e[0m"
tmux_plugin_dir="$HOME/.tmux/plugins/tpm"
if [ -d $tmux_plugin_dir ]; then
  echo -e "Directory already exists\n"
else
  git clone https://github.com/tmux-plugins/tpm $tmux_plugin_dir
  sudo apt install urlview -y
  echo -e "\e[32mSuccess\e[0m\n"
fi

# Creating backup
tmux_file="$HOME/.tmux.conf"
if [ -e $tmux_file ]; then
  echo -e "\e[33mCreating backup file (.tmux.conf.bak)...\e[0m"
  cp $HOME/.tmux.conf $HOME/.tmux.conf.bak
  echo -e "\e[32mSuccess\e[0m\n"
fi

# Copying template
echo -e "\e[33mInstall tmux.conf...\e[0m"
cp $DIR/tmux.conf $HOME/.tmux.conf
echo -e "\e[32mSuccess\e[0m"
