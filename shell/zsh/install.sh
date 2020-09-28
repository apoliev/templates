#!/bin/sh

DIR="$(dirname "$(readlink -f "$0")")"

echo "Create bak for zshrc"
mv $HOME/.zshrc $HOME/.zshrc.bak
echo "Copy .zshrc"
cp $DIR/zshrc $HOME/.zshrc

echo "copy plugins"
cp -a $DIR/plugins/conda $HOME/.oh-my-zsh/custom/plugins
cp -a $DIR/plugins/rvm $HOME/.oh-my-zsh/custom/plugins
cp -a $DIR/plugins/nvm $HOME/.oh-my-zsh/custom/plugins

echo "copy themes"
cp $DIR/themes/bira-shell.zsh-theme $HOME/.oh-my-zsh/custom/themes

echo "copy base zsh scripts"
echo 'rvm_silence_path_mismatch_check_flag=1' > $HOME/.rvmrc
