function rvm_prompt_info() {
  current="$(rvm version current)"
  default="$(rvm list | awk '/*.+ruby/ {print $2}')"

  if [ $current != $default ]; then
    echo "${ZSH_THEME_RUBY_PROMPT_PREFIX:=[}$current${ZSH_THEME_RUBY_PROMPT_SUFFIX:=]}"
  fi
}

# >>> rvm initialize >>>
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

[[ -d "$HOME/.rvm" ]] && export PATH="$PATH:$HOME/.rvm/bin"
# <<< rvm initialize <<<
