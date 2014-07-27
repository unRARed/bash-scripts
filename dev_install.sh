#!/bin/bash
# Ubuntu 14.04 for nodeJS and Ruby development.

# Dependencies 
sudo apt-get install python-software-properties curl -y

# Setup Git
git config --global user.email "ryananthonyrichardson@gmail.com" 
git config --global user.name "Ryan Richardson"
git config --global color.ui true
git config --global alias.history "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# NVM: node-version manager and node
curl https://raw.githubusercontent.com/creationix/nvm/v0.5.1/install.sh | sh
echo "export NVM_DIR=~/.nvm" >> ~/.bashrc
echo "source ~/.nvm/nvm.sh" >> ~/.bashrc
source ~/.nvm/nvm.sh
nvm install v0.11.13
nvm use v0.11.13
nvm alias default 0.11

# RVM: ruby-version manager, ruby and rails
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc # this doesn't always work
rvm install 2.1.2
rvm use 2.1.2 --default

# Heroku Toolbelt
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Sublime Text 3
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update && sudo apt-get install sublime-text-installer
