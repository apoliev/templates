#!/bin/bash

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

start() {
  sudo systemctl start "$1" && echo "$1 started"
}

stop() {
  sudo systemctl stop "$1" && echo "$1 stoped"
}

status() {
  sudo systemctl status "$1"
}

list() {
  list=($@)
  echo "List of DBMS:"
  for i in "${list[@]}"; do
    echo "- $i"
  done
}

default() {
  echo "$1" > $2
  cat $2
}

show_help() {
    help_text="Usage: db [COMMAND]...[[DBMS]]"
    help_text="$help_text\nCommand's list:\n"
    help_text="$help_text\tstart - start db server;\n"
    help_text="$help_text\tstop - stop db server;\n"
    help_text="$help_text\trestart - restart db server;\n"
    help_text="$help_text\tlist - list of DBMS\n"
    help_text="$help_text\tdefault - set default DBMS\n"
    help_text="$help_text\t--help - show help;\n"
    printf "$help_text"
}

dbms_list=(mariadb postgresql)
config_file="$HOME/.db_runner"

if [ -f "$config_file" ]; then
  dbms="$(cat $config_file)"
else
  dbms="mariadb"
fi

if [ -n "$2" ]; then
  dbms=$2
fi

if ! array_contains dbms_list "$dbms"; then
  echo "DBMS is not supported!"
  exit 1
fi

case "$1" in
      start)
        start "$dbms"
        ;;

      stop)
        stop "$dbms"
        ;;

      status)
        status "$dbms"
        ;;

      restart)
        stop "$dbms"
        start "$dbms"
        ;;

      list)
        list "${dbms_list[@]}"
        ;;

      default)
        if [ -n "$2" ]; then
          default $2 "$config_file"
        else
          cat "$config_file"
        fi
        ;;

      --help)
        show_help
        ;;

      *)
        echo "Command not found!"
        exit 1
esac
