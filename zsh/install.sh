#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")"

source $DIR/../shell/prompt_utils.sh

# Install dependencies
(prompt_txt 'Install dependencies...' &&
sudo apt install fzf -y &&
show_success 'Success') || show_error 'Error'

# Creating backup
zshrc_file="$HOME/.zshrc"
if [ -e $zshrc_file ]; then
  (prompt_txt 'Creating backup file (.zshrc.bak)...' &&
  cp $HOME/.zshrc $HOME/.zshrc.bak &&
  show_success 'Success') || show_error 'Error'
fi

# Copying template
(prompt_txt 'Install zshrc...' &&
cp $DIR/zshrc $HOME/.zshrc &&
show_success 'Success') || show_error 'Error'

# Copying plugins
(prompt_txt 'Copying plugins...' &&
cp -a $DIR/plugins/conda $HOME/.oh-my-zsh/custom/plugins &&
cp -a $DIR/plugins/rvm $HOME/.oh-my-zsh/custom/plugins &&
cp -a $DIR/plugins/nvm $HOME/.oh-my-zsh/custom/plugins &&
show_success 'Success') || show_error 'Error'

# load vendor plugins
fzf_tab_dir="$HOME/.oh-my-zsh/custom/plugins/fzf-tab"
if [ -d $fzf_tab_dir ]; then
  (prompt_txt 'Pulling updates for fzf-tab' &&
  git -C $fzf_tab_dir pull &&
  show_success 'Success') || show_error 'Error'
else
  (prompt_txt 'Load fzf-tab...' &&
  git clone https://github.com/Aloxaf/fzf-tab $fzf_tab_dir &&
  show_success 'Success') || show_error 'Error'
fi

# Copying themes
(prompt_txt 'Copying themes...' &&
cp $DIR/themes/bira-shell.zsh-theme $HOME/.oh-my-zsh/custom/themes &&
show_success 'Success') || show_error 'Error'

# Settings for plugins
(prompt_txt 'Set configs for plugins...' &&
echo "rvm_silence_path_mismatch_check_flag=1" > $HOME/.rvmrc &&
echo "changeps1: false" > $HOME/.condarc &&
show_success 'Success') || show_error 'Error'
