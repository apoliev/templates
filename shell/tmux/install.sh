#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")"

echo "Load plugins"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Create tmux.conf.bak"
cp $HOME/.tmux.conf $HOME/.tmux.conf.bak

echo "Copy tmux.conf"
cp $DIR/tmux.conf $HOME/.tmux.conf
