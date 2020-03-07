#!/bin/sh
echo "Copy .zshrc"
cp zshrc $HOME/.zshrc

echo "copy plugins"
cp -a plugins/conda $HOME/.oh-my-zsh/custom/plugins
cp -a plugins/rvm $HOME/.oh-my-zsh/custom/plugins

echo "copy themes"
cp -R themes $HOME/.oh-my-zsh/custom/themes

echo "copy base zsh scripts"
cp ruby_prompt.zsh $HOME/.oh-my-zsh/custom
