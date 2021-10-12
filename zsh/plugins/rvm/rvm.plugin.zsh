rvm_dir="$HOME/.rvm"

if [ -d "$rvm_dir" ]; then

  function rvm_prompt() {
    current="$RUBY_VERSION"
    default="$RVM_DEFAULT_ENV"
    if [ "$default" != "$current" ]; then
      echo "${ZSH_THEME_RUBY_PROMPT_PREFIX}${current}${ZSH_THEME_RUBY_PROMPT_SUFFIX}"
    fi
  }

  # >>> rvm initialize >>>
  [[ -s "$rvm_dir/scripts/rvm" ]] && source "$rvm_dir/scripts/rvm" 

  [[ -d "$rvm_dir" ]] && export PATH="$PATH:$rvm_dir/bin"
  
  export RVM_DEFAULT_ENV="$(rvm alias show default)"
  # <<< rvm initialize <<<
else
  echo "RVM directory not found"
fi
