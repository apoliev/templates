#!/bin/bash

source $HOME/.local/lib/prompt_utils.sh

(prompt_txt 'Cleaning packs...' &&
find $HOME/workspace -wholename '**public/packs*' | xargs rm -rf &&
show_success 'Success') || show_error 'Error'

(prompt_txt 'Cleaning uploads...' &&
find $HOME/workspace -wholename '**public/uploads*' | xargs rm -rf &&
show_success 'Success') || show_error 'Error'

(prompt_txt 'Cleaning logs...' &&
find $HOME/workspace -wholename '**log/development.log' | xargs rm -rf &&
find $HOME/workspace -wholename '**log/test.log' | xargs rm -rf &&
find $HOME/workspace -wholename '**log/production.log' | xargs rm -rf &&
show_success 'Success') || show_error 'Error'

(prompt_txt 'Cleaning cache...' &&
rm -rf $HOME/.cache/* &&
show_success 'Success') || show_error 'Error'
