#!/bin/sh

echo "Load Oh My ZSH"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Copy .zshrc"
cp zshrc $HOME/.zshrc

echo "copy plugins"
cp -a plugins/conda $HOME/.oh-my-zsh/custom/plugins
cp -a plugins/rvm $HOME/.oh-my-zsh/custom/plugins

echo "copy themes"
cp themes/bira-custom.zsh-theme $HOME/.oh-my-zsh/custom/themes

echo "copy base zsh scripts"
cp ruby_prompt.zsh $HOME/.oh-my-zsh/custom
echo 'rvm_silence_path_mismatch_check_flag=1' > $HOME/.rvmrc
