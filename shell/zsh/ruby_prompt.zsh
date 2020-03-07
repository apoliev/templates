function ruby_prompt_info() {
  if [ -f "$(pwd)/.ruby-version" ]; then
    echo $(rvm_prompt_info || rbenv_prompt_info || chruby_prompt_info)
  fi
}