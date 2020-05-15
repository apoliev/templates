function rvm_default() {
  if [ -f "$HOME/.rvm/config/alias" ]; then
    default=($(awk '/default/ {print}' $HOME/.rvm/config/alias | tr "=" "\n"))
    echo "${ZSH_THEME_RUBY_PROMPT_PREFIX}${default[2]}${ZSH_THEME_RUBY_PROMPT_SUFFIX}"
  fi
}

# >>> rvm initialize >>>
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

[[ -d "$HOME/.rvm" ]] && export PATH="$PATH:$HOME/.rvm/bin"
# <<< rvm initialize <<<
