#!/bin/bash
# Ubuntu 16.04 for development.

# Prompt user for installation information
while [ -z "$GIT_EMAIL" ]
do
	read -p "Git Email: " email
	case $email in
		*[@]* ) GIT_EMAIL=$email;;
		* ) echo "Please enter a valid email address.";;
	esac
done

read -p "Git User Name: " GIT_USER_NAME

sudo apt-get update

# Dependencies
sudo apt-get install curl -y

# Main Dev Libraries
sudo apt-get install build-essential

# Git
sudo apt-get install git
git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_USER_NAME
source config/git.sh

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
rvm install 2.3.3
rvm use 2.3.3 --default
gem install bundler

# Heroku Toolbelt
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Postgres
sudo apt-get install postgresql postgresql-contrib libpq-dev # libpq-dev needed for Ruby PG Gem
sudo -u postgres createuser --superuser $USER #adds current user to PG
