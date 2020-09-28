nvm_dir="$HOME/.nvm"

if [ -d "$nvm_dir" ]; then
  function nvm_prompt() {
    current="$(nvm version current)"
    default="$NVM_DEFAULT_ENV"
    if [ "$default" != "$current" ]; then
      echo "${ZSH_THEME_NVM_PROMPT_PREFIX}nvm-${current}${ZSH_THEME_NVM_PROMPT_SUFFIX}"
    fi
  }

  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  
  export NVM_DEFAULT_ENV="$(nvm version default)"
fi 
