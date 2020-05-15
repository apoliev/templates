function rvm_default() {
  default=($(awk '/default/ {print}' $HOME/.rvm/config/alias | tr "=" "\n"))
  echo "${ZSH_THEME_RUBY_PROMPT_PREFIX}${default[2]}${ZSH_THEME_RUBY_PROMPT_SUFFIX}"
}

# >>> rvm initialize >>>
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

[[ -d "$HOME/.rvm" ]] && export PATH="$PATH:$HOME/.rvm/bin"
# <<< rvm initialize <<<
