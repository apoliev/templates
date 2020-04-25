#!/bin/bash

zsh="shell/zsh"
tmux="shell/tmux"
vim="vim"

plugins=(zsh tmux vim)

array_contains () { 
  array="$1[@]"
  seeking=$2
  in=1
  for element in "${!array}"; do
      if [[ $element == $seeking ]]; then
          in=0
          break
      fi
  done
  return $in
}


if [ $# -gt 0 ]; then
  list=($@)

  for i in "${list[@]}"; do
    if ! array_contains plugins "$i"; then
      echo "Not found $i!"
      exit 1
    fi

    cd ${!i} && ./install.sh && cd -
  done
else
  for i in "${plugins[@]}"; do
    cd ${!i} && ./install.sh && cd -
  done
fi
