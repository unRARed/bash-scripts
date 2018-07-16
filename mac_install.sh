#!/bin/bash

# OSX pre-reqs
sudo xcodebuild -license accept
xcode-select --install

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles YES

# set keyrepeat (Sierra/High Sierra)
defaults write NSGlobalDomain InitialKeyRepeat -int 20
defaults write NSGlobalDomain KeyRepeat -int 1

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Various generic commandline utils
brew install wget

# Git and bash/git completion
brew install git bash-completion # Note, the OSX pre-installed Git will not work with bash-completion
git config --global user.name "Ryan Richardson"
git config --global user.email "ryananthonyrichardson@gmail.com"
source config/git.sh
echo -e "if [ -f `brew --prefix`/etc/bash_completion ]; then\n    . `brew --prefix`/etc/bash_completion\nfi" >> ~/.bash_profile

# git-aware bash prompt
brew install bash-git-prompt
echo -e "if [ -f \"$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh\" ]; then\n    source \"$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh\"\nfi" >> ~/.bash_profile

# Docker
brew install docker
brew install docker-compose
# "starter", tool to examine repo and bootstrap Dockerfile
curl -sSL https://raw.githubusercontent.com/cloud66/starter/master/install.sh | bash

# Allow writing to NTFS drives
# Example: sudo /usr/local/bin/ntfs-3g /dev/disk1s1 /Volumes/NTFS -olocal -oallow_other
# sub /dev/disk1s1 with your disk (find it with diskutil list)
brew cask install osxfuse
brew install homebrew/fuse/ntfs-3g
sudo mkdir /Volumes/NTFS

# Python
brew install pyenv
pyenv install 3.5.3
pyenv global 3.5.3
echo 'if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi' >> ~/.bashrc
source ~/.bashrc

# Ruby
echo "gem: --no-document" >> ~/.gemrc
curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
rvm install 2.5.0
rvm use 2.5.0 --default
gem install bundler

# Node Version Manager
curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash
source ~/.bashrc
nvm install 7.3.0
nvm alias default v7.3.0

# Postrgresql Database (v10 as of Oct. 17)
brew install postgresql
brew services start postgresql
# echo "rm /usr/local/var/postgres/postmaster.pid" >> ~/.bashrc # fix the server running locally and accepting connections on Unix domain socket "/tmp/.s.PGSQL.5432" bullshit
# ^ need IF exists conditional here...

# Sublime Text 3
brew install caskroom/cask/brew-cask
brew tap caskroom/versions
brew cask install sublime-text

# JAVA and Android tools (basically, for adb)
brew cask install java7
brew cask install android-platform-tools

# Mission Pinball Framework
wget https://mpf.kantert.net/mpf_mac_frameworks.zip
unzip mpf_mac_frameworks.zip
sudo mv Frameworks/* /Library/Frameworks/
rm -Rf Frameworks
rm -Rf __MACOSX
rm -Rf ReadMe.txt
rm -Rf License.txt
rm -Rf mpf_mac_frameworks.zip
pip3 install pip setuptools cython==0.24.1 --upgrade
pip3 install mpf mpf-mc mpf-monitor

source ~/.bash_profile
