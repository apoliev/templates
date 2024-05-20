#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")"

source $DIR/../shell/prompt_utils.sh

# Loading plugins
tmux_plugin_dir="$HOME/.tmux/plugins/tpm"
prompt_txt 'Loading plugins...'
if [ -d $tmux_plugin_dir ]; then
  echo -e "Directory already exists\n"
else
  (git clone https://github.com/tmux-plugins/tpm $tmux_plugin_dir &&
  sudo apt install urlview -y &&
  show_success 'Success') || show_error 'Error'
fi

# Creating backup
tmux_file="$HOME/.tmux.conf"
if [ -e $tmux_file ]; then
  (prompt_txt 'Creating backup file (.tmux.conf.bak)...' &&
  cp $HOME/.tmux.conf $HOME/.tmux.conf.bak &&
  show_success 'Success') || show_error 'Error'
fi

# Copying template
(prompt_txt 'Install tmux.conf...' &&
cp $DIR/tmux.conf $HOME/.tmux.conf &&
show_success 'Success') || show_error 'Error'
