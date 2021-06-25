#!/usr/bin/env bash
# Kyle's bash setup script
# Quickly setup Sandbox

# Update/upgrade
sudo apt-get -y update
sudo apt-get -y upgrade

service mysql start

# Setup aliases for .bashrc
echo -e \
"\n# PERSONAL ALIASES\n\
alias x='chmod u+x'\n\
# gcc\n\
alias g='gcc -Wall -Werror -Wextra -pedantic'\n\
alias gput='gcc -Wall -Werror -Wextra -pedantic _putchar.c'\n\
# git\n\
alias ga='git add'\n\
alias gc='git commit -m'\n\
alias gp='git push'\n\
# valgrind\n\
alias v='valgrind --leak-check=full --track-origins=yes --show-leak-kinds=all -v'\n\
# doctest\n\
alias dt='python3 -m doctest'\n\
# autopep8\n\
alias ap='autopep8 -i -a'" >> ~/.bashrc

# .vimrc setup
echo -e \
"syntax on\n\
set background=dark\n\
set number\n\
\"FOR C\n\
\"set cindent\n\n\
\"FOR PYTHON\n\
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab\n\
set smartindent" > ~/.vimrc

source ~/.bashrc
