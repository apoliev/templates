#!/bin/sh

DIR="$(dirname "$(readlink -f "$0")")"

echo "Copy .zshrc"
cp $DIR/zshrc $HOME/.zshrc

echo "copy plugins"
cp -a $DIR/plugins/conda $HOME/.oh-my-zsh/custom/plugins
cp -a $DIR/plugins/rvm $HOME/.oh-my-zsh/custom/plugins

echo "copy themes"
cp $DIR/themes/bira-custom.zsh-theme $HOME/.oh-my-zsh/custom/themes

echo "copy base zsh scripts"
cp $DIR/ruby_prompt.zsh $HOME/.oh-my-zsh/custom
echo 'rvm_silence_path_mismatch_check_flag=1' > $HOME/.rvmrc
