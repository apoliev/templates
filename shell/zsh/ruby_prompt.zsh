[ ! -x rvm_default ] && function rvm_default() { echo "" }

function ruby_prompt_info() {
  prompt=$(rvm_prompt_info)

  if [ -n "$(rvm_default)" ] && [ "$(rvm_default)" != "$prompt" ]; then
    echo "$prompt"
    return
  fi

  if [ -z "$(rvm_default)" ]; then
    echo $(rvm_prompt_info || rbenv_prompt_info || chruby_prompt_info)
  fi
}
