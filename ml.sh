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

    # opencv-python
pip install --user opencv-python

    # dlib
sudo apt-get update
sudo apt-get install -y build-essential cmake
sudo apt-get install -y libopenblas-dev liblapack-dev
sudo apt-get install -y libx11-dev libgtk-3-dev
sudo apt-get install -y python3 python3-dev python3-pip
pip install --user dlib==19.17.0

# Edit bashrc file to enable X servers
echo "export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0" >> ~/.bashrc
echo "export LIBGL_ALWAYS_INDIRECT=1" >> ~/.bashrc

