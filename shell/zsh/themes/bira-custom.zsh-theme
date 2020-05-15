# ZSH Theme - Preview: https://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n %{$reset_color%}'
    local user_symbol='#'
else
    local user_host='%{$terminfo[bold]$fg[green]%}%n %{$reset_color%}'
    local user_symbol='$'
fi

[ ! -x conda_prompt_info ] && function conda_prompt_info() { echo "" }

function enviroments() {
  if [ -z "$(git_prompt_info)$(ruby_prompt_info)$(conda_prompt_info)$(virtualenv_prompt_info)" ]; then
    echo ""
  else
    echo "[ $(git_prompt_info)$(ruby_prompt_info)$(conda_prompt_info)$(virtualenv_prompt_info)]"
  fi
}

local current_dir='%{$terminfo[bold]$fg[blue]%}%~ %{$reset_color%}'

local envs='$(enviroments)'

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

PROMPT="╭─${user_host}${current_dir}${envs}
╰─%B${user_symbol}%b "
RPROMPT="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_CONDA_PREFIX="%{$fg[cyan]%}‹"
ZSH_THEME_CONDA_SUFFIX="› %{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[cyan]%}‹"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX
