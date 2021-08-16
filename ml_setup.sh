#!/usr/bin/env bash
# Kyle's ML environment setup script
# Includes:
#       pip
#       pycodestyle
#       numpy
#       scipy
#       matplotlib
# WSL2 - Ubuntu-18.04

# Update/upgrade
sudo apt-get -y update
sudo apt-get -y upgrade

# Install pip
sudo apt-get -y install python3-pip
wget https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
rm get-pip.py

# Install Packages:
    # numpy
pip install --user numpy==1.15

    # scipy
pip install --user scipy==1.3

    # pycodestyle
pip install --user pycodestyle==2.5

    # matplotlib
pip install --user matplotlib==3.0
pip install --user Pillow
sudo apt-get -y install python3-tk
