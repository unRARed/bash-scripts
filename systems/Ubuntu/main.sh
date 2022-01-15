#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install git
./shared/_git.sh

# Dependencies
sudo apt-get install tmux curl -y

# Main Dev Libraries
sudo apt-get install build-essential

# Make caps_lock be escape
echo "setxkbmap -option" >> ~/.bashrc
echo "setxkbmap -option caps:escape" >> ~/.bashrc

# Pyenv (python)
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc
pyenv install 3.5.3
pyenv global 3.5.3

# NVM: node-version manager and node
curl https://raw.githubusercontent.com/creationix/nvm/v0.5.1/install.sh | sh
echo "export NVM_DIR=~/.nvm" >> ~/.bashrc
echo "source ~/.nvm/nvm.sh" >> ~/.bashrc
source ~/.nvm/nvm.sh
nvm install v7.3.0
nvm use v7.3.0
nvm alias default 7.3.0

# RVM: ruby-version manager
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc # this doesn't always work
rvm install 2.5.0
rvm use 2.5.0 --default
gem install bundler

# Heroku Toolbelt
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Postgres
sudo apt-get install postgresql postgresql-contrib libpq-dev # libpq-dev needed for Ruby PG Gem
sudo -u postgres createuser --superuser $USER #adds current user to PG

# Mission Pinball dependencies
pip install kivy
pip install setuptools cython==0.25.2 --upgrade
pip install mpf mpf-mc mpf-monitor --pre

# Spotify
sudo echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
sudo apt-get update && sudo apt-get install spotify-client

# XBMC
sudo apt-get install python-software-properties pkg-config
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:team-xbmc/unstable
sudo apt-get update
sudo apt-get install xbmc
