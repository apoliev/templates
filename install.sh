#!/bin/bash

set -e

DIR="$(dirname "$(readlink -f "$0")")"

source $DIR/shell/prompt_utils.sh

(prompt_txt 'Update all...' &&
sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y &&
sudo snap refresh &&
show_success "Success\n") || (show_error 'Error' && exit 1)

(prompt_txt 'Install programs...' &&
sudo apt install -y \
build-essential \
cmake \
fzf \
git \
libgmp-dev \
libpq-dev \
libssl-dev \
libyaml-dev \
make \
openssh-server \
ripgrep \
rustc \
tmux \
urlview \
vim \
xclip \
zlib1g-dev \
zsh &&
curl https://mise.jdx.dev/install.sh | sh &&
show_success "Success\n") || (show_error 'Error' && exit 1)

# Templates for shell
prompt_txt "\nLoading shell configs..." && sh -c $DIR/shell/install.sh

# Templates for zsh
prompt_txt "\nLoading zsh configs..." && sh -c $DIR/zsh/install.sh

# Templates for vim
prompt_txt "\nLoading vim configs..." && sh -c $DIR/vim/install.sh

# Templates for tmux
prompt_txt "\nLoading tmux configs..." && sh -c $DIR/tmux/install.sh
