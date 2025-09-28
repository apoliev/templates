#!/bin/bash

set -e

DIR="$(dirname "$(readlink -f "$0")")"

source $DIR/../shell/prompt_utils.sh

# Install dependencies
(prompt_txt 'Install dependencies...' &&
sudo apt install fzf -y &&
show_success "Success\n") || (show_error 'Error' && exit 1)

# Creating backup
zshrc_file="$HOME/.zshrc"
if [ -e $zshrc_file ]; then
  (prompt_txt 'Creating backup file (.zshrc.bak)...' &&
  cp $HOME/.zshrc $HOME/.zshrc.bak &&
  show_success "Success\n") || (show_error 'Error' && exit 1)
fi

# Copying template
(prompt_txt 'Install zshrc...' &&
cp $DIR/zshrc $HOME/.zshrc &&
show_success "Success\n") || (show_error 'Error' && exit 1)

# load vendor plugins
fzf_tab_dir="$HOME/.oh-my-zsh/custom/plugins/fzf-tab"
if [ -d $fzf_tab_dir ]; then
  (prompt_txt 'Pulling updates for fzf-tab...' &&
  git -C $fzf_tab_dir pull &&
  show_success "Success\n") || (show_error 'Error' && exit 1)
else
  (prompt_txt 'Load fzf-tab...' &&
  git clone https://github.com/Aloxaf/fzf-tab $fzf_tab_dir &&
  show_success "Success\n") || (show_error 'Error' && exit 1)
fi

# Copying themes
(prompt_txt 'Copying themes...' &&
cp -a $DIR/themes $HOME/.oh-my-zsh/custom/themes &&
show_success "Success\n") || (show_error 'Error' && exit 1)
