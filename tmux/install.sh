#!/bin/bash

set -e

DIR="$(dirname "$(readlink -f "$0")")"

source $DIR/../shell/prompt_utils.sh

# Loading plugins
tmux_plugin_dir="$HOME/.tmux/plugins/tpm"
prompt_txt 'Loading plugins...'
if [ -d $tmux_plugin_dir ]; then
  show_warn "Directory already exists\n"
else
  (git clone https://github.com/tmux-plugins/tpm $tmux_plugin_dir &&
  sudo apt install urlview -y &&
  show_success "Success\n") || (show_error 'Error' || exit 1)
fi

# Creating backup
tmux_file="$HOME/.tmux.conf"
if [ -e $tmux_file ]; then
  (prompt_txt 'Creating backup file (.tmux.conf.bak)...' &&
  cp $HOME/.tmux.conf $HOME/.tmux.conf.bak &&
  show_success "Success\n") || (show_error 'Error' && exit 1)
fi

# Copying template
(prompt_txt 'Install tmux.conf...' &&
cp $DIR/tmux.conf $HOME/.tmux.conf &&
show_success "Success\n") || (show_error 'Error' && exit 1)

(prompt_txt 'Install or update plugins...' &&
sh -c $HOME/.tmux/plugins/tpm/bin/install_plugins &&
sh -c "$HOME/.tmux/plugins/tpm/bin/update_plugins all"
show_success "Success") || (show_error 'Error' && exit 1)
