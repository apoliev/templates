function conda_prompt_info(){
    [[ -n ${CONDA_DEFAULT_ENV} ]] && [[ ${CONDA_DEFAULT_ENV} != "base" ]] || return
    echo "${ZSH_THEME_CONDA_PREFIX:=[}conda-${CONDA_DEFAULT_ENV:t}${ZSH_THEME_CONDA_SUFFIX:=]}"
}

# disables prompt mangling in virtual_env/bin/activate
export CONDA_DISABLE_PROMPT=1

anaconda_dir="$HOME/.local/anaconda3"

if [ -d ${anaconda_dir} ]; then
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('$anaconda_dir/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$anaconda_dir/etc/profile.d/conda.sh" ]; then
            . "$anaconda_dir/etc/profile.d/conda.sh"
        else
            export PATH="$anaconda_dir/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
fi
