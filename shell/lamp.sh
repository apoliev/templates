#!/bin/bash

start() {
    sudo systemctl start apache2
    echo "Apache started"

    sudo systemctl start mysql
    echo "MariaDB started"
}

stop() {
    sudo systemctl stop apache2
    echo "Apache stopped"

    sudo systemctl stop mysql
    echo "MariaDB stopped"
}

show_help() {
    help_text="Usage: lamp [COMMAND]"
    help_text="$help_text\nCommand's list:\n"
    help_text="$help_text\tstart - start lamp;\n"
    help_text="$help_text\tstop - stop lamp;\n"
    help_text="$help_text\trestart - restart lamp;\n"
    help_text="$help_text\t--help - show help;\n"
    printf "$help_text"
}

case "$1" in
      start)
        start
        ;;

      stop)
        stop
        ;;

      restart)
        stop
        start
        ;;

      --help)
        show_help
        ;;

      *)
        echo "Command not found!"
        exit 1
esac
