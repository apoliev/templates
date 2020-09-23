export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

function nvm_prompt_info() {
  current="$(nvm version current)"
  default="$(nvm version default)"
  if [ $current != $default ]; then
    echo "${ZSH_THEME_NVM_PREFIX:=[}nvm-$current${ZSH_THEME_NVM_SUFFIX:=]}"
  fi
}
