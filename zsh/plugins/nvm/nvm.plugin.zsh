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

  autoload -U add-zsh-hook

  load-nvmrc() {
    local nvmrc_path
    nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
      local nvmrc_node_version
      nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

      if [ "$nvmrc_node_version" = "N/A" ]; then
        nvm install
      elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
        nvm use
      fi
    elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
      echo "Reverting to nvm default version"
      nvm use default
    fi
  }

  add-zsh-hook chpwd load-nvmrc
  load-nvmrc
fi
