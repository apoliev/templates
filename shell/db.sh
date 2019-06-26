#!/bin/bash

start() {
    case "$1" in
        mysql | maria)
          sudo systemctl start mysql
          echo "MariaDB started"
          ;;

        postgresql | postgres)
          sudo systemctl start postgresql
          echo "PostgreSQL started"
          ;;

        *)
          echo "This DBMS is not supported!"
          exit 1
    esac
}

stop() {
    case "$1" in
        mysql | maria)
            sudo systemctl stop mysql
            echo "MariaDB stopped"
            ;;

        postgresql | postgres)
            sudo systemctl stop postgresql
            echo "PostgreSQL stopped"
            ;;

        *)
        echo "This DBMS is not supported!"
        exit 1
    esac
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

dbms_list=(maria postgres)
config_file="$HOME/.db_runner"
if [ -f "$config_file" ]; then
  dbms="$(cat $config_file)"
else
  dbms="maria"
fi

if [ -n "$2" ]; then
  dbms=$2
fi

case "$1" in
      start)
        start "$dbms"
        ;;

      stop)
        stop "$dbms"
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
