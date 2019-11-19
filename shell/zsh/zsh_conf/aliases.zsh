# for apt
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias add='sudo apt install -y'
alias remove='sudo apt purge'
alias search='sudo apt-cache show'

# for snap
alias supdate='snap refresh'
alias sadd='snap install'
alias sremove='snap remove --purge'
alias ssearch='snap find'

# for daemons
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias restart='sudo systemctl restart'
alias status='sudo systemctl status'

alias vi='vim'
