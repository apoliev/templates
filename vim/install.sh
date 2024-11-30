#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")"

source $DIR/../shell/prompt_utils.sh

# Install dependencies
(prompt_txt 'Loading dependencies' &&
sudo apt install -y ripgrep &&
show_success 'Success') || show_error 'Error'

# Loading Vundle
vundle_directory="$HOME/.vim/bundle/Vundle.vim"
prompt_txt 'Loading Vundle...'
if [ -d $vundle_directory ]; then
  echo -e "Directory already exists\n"
else
  (git clone https://github.com/VundleVim/Vundle.vim.git $vundle_directory && show_success 'Success') || show_error 'Error'
fi

# Creating backup
vimrc_file="$HOME/.vimrc"
if [ -e $vimrc_file ]; then
  (prompt_txt 'Creating backup file (.vimrc.bak)...' &&
  cp $HOME/.vimrc $HOME/.vimrc.bak &&
  show_success 'Success') || show_error 'Error'
fi

# Copying template
(prompt_txt 'Install vimrc...' &&
cp $DIR/vimrc $HOME/.vimrc &&
show_success 'Success') || show_error 'Error'

# Instaliing plugins
(prompt_txt 'Install Plugins...' &&
vim +PluginInstall +qall &&
show_success 'Success') || show_error 'Error'
