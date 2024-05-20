#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")"

source $DIR/prompt_utils.sh

(prompt_txt 'Install prompt_utils...' &&
cp $DIR/prompt_utils.sh $HOME/.local/lib/ &&
show_success 'Success') || show_error 'Error'

(prompt_txt 'Install clean.sh...' &&
cp $DIR/clean.sh $HOME/bin/ &&
show_success 'Success') || show_error 'Error'
