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

show_help() {
    help_text="Usage: db [COMMAND]...[[DBMS]]"
    help_text="$help_text\nCommand's list:\n"
    help_text="$help_text\tstart - start db server;\n"
    help_text="$help_text\tstop - stop db server;\n"
    help_text="$help_text\trestart - restart db server;\n"
    help_text="$help_text\t--help - show help;\n"
    printf "$help_text"
}

dbms="maria"

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

      --help)
        show_help
        ;;

      *)
        echo "Command not found!"
        exit 1
esac
