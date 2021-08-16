#!/usr/bin/env bash
# Kyle's bash setup script
# Quickly setup new VM or Sandbox

# Update/upgrade
sudo apt-get -y update
sudo apt-get -y upgrade

# Install packages
#sudo apt-get -y install gcc
#sudo apt-get -y install pep8
#sudo apt-get -y install python3-pip
#pip3 install --upgrade pip3
#sudo apt-get install -y mysql-server

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
# pycodestyle\n\
alias p='pycodestyle'" >> ~/.bashrc

source ~/.bashrc

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
