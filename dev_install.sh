#!/bin/bash
# Ubuntu 13.10 for nodeJS and Ruby development.

# Dependencies 
sudo apt-get install python-software-properties curl -y

# Setup Git
git config --global user.email "ryananthonyrichardson@gmail.com" 
git config --global user.name "Ryan Richardson" 

# NVM: node-version manager and node
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
source ~/.nvm/nvm.sh
echo "source ~/.nvm/nvm.sh" >> ~/.bashrc
nvm install v0.10.26
nvm use v0.10.26
nvm alias default 0.10

# RVM: ruby-version manager, ruby and rails
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
rvm install 2.1.0
rvm use 2.1.0 --default

# Heroku Toolbelt
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Sublime Text 2
sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo apt-get update && sudo apt-get install sublime-text