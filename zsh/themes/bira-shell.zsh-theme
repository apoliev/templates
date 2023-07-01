local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [ -z "$SSH_CLIENT" ]; then
  local ssh_client=''
else
  local ssh_client=" via ssh"
fi

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n$ssh_client %{$reset_color%}'
    local user_symbol='#'
else
    local user_host='%{$terminfo[bold]$fg[green]%}%n$ssh_client %{$reset_color%}'
    local user_symbol='$'
fi

type git_prompt_info >> /dev/null || function git_prompt_info() { echo "" }
type conda_prompt >> /dev/null || function conda_prompt() { echo "" }
type rvm_prompt >> /dev/null || function rvm_prompt() { echo "" }
type nvm_prompt >> /dev/null || function nvm_prompt() { echo "" }
type virtualenv_prompt_info >> /dev/null || function virtualenv_prompt_info() { echo "" }

function enviroments() {
  prompt="$(git_prompt_info)$(rvm_prompt)$(conda_prompt)$(virtualenv_prompt_info)$(nvm_prompt)"
  if [ -z "$prompt" ]; then
    echo ""
  else
    echo "[ $prompt] "
  fi
}

local envs='$(enviroments)'
local current_dir='%{$terminfo[bold]$fg[blue]%}%~ %{$reset_color%}'

PROMPT="${user_host}${current_dir}${envs}%B${user_symbol}%b "
RPROMPT="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_NVM_PROMPT_PREFIX="%{$fg[blue]%}‹"
ZSH_THEME_NVM_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_CONDA_PREFIX="%{$fg[cyan]%}‹"
ZSH_THEME_CONDA_SUFFIX="› %{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[cyan]%}‹"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX
