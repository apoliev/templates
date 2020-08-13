#!/bin/bash

start() {
  sudo systemctl start "$1" && echo "$1 started"
}

stop() {
  sudo systemctl stop "$1" && echo "$1 stoped"
}

status() {
  sudo systemctl status "$1"
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
    help_text="$help_text\tdefault - set default DBMS\n"
    help_text="$help_text\t--help - show help;\n"
    printf "$help_text"
}

config_file="$HOME/.db_runner"

if [ -n "$2" ]; then
  dbms=$2
elif [ -f "$config_file" ]; then
  dbms="$(cat $config_file)"
else
  echo "You haven't default dbms!"
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
