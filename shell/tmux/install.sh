#!/bin/bash

echo "Load plugins"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Copy tmux.conf"
cp tmux.conf $HOME/.tmux.conf
