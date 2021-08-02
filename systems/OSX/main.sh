#!/usr/bin/env bash

## Homebrew and various dependencies
echo "Installing Homebrew...\n"
/usr/bin/ruby -e \
	"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install zsh zsh-completions nodejs gpg git git-lfs imagemagick yarn pinentry-mac gcc dnsmasq git-lfs
brew tap homebrew/cask
brew install --cask chromedriver

echo "Installing Postgresql database...\n"
## Postgresql
brew install postgresql
brew services start postgresql

./systems/OSX/_zsh.sh
./systems/OSX/_tweaks.sh
./shared/_rvm.sh
./shared/_git.sh

# Allow upgrading package.json deps to latest via `ncu -u`
# (akin to bundle update)
yarn global add npm-check-updates

## git-aware terminal prompt
npm install -g spaceship-prompt

###############################
## Recommended Optional Apps ##
###############################
read -r -p "Configure VIM as an IDE? [y/N] " response
if [[ "$response" =~ $YES ]]
then
  rm -Rf ./console-ide
  git clone https://github.com/unRARed/console-ide.git
  cd ./console-ide && ./install.sh -y
  cd .. && rm -Rf ./console-ide
fi

read -r -p "Install SublimeText? [y/N] " response
if [[ "$response" =~ $YES ]]
then
  brew install caskroom/cask/brew-cask
  brew tap caskroom/versions
  brew cask install sublime-text
fi

read -r -p "Install free clamav Anti-virus? [y/N] " response
if [[ "$response" =~ $YES ]]
then
  brew install clamav
fi

read -r -p "Install Karabiner Elements for key re-mapping? [y/N] " response
if [[ "$response" =~ $YES ]]
then
  brew install karabiner-elements
fi

read -r -p "Modify the OSX Terminal theme? [y/N] " response
if [[ "$response" =~ $YES ]]
then
  open "OSX.terminal"
  sleep 1 # Wait a bit to make sure the theme is loaded
  defaults write com.apple.terminal \
    "Default Window Settings" -string "OSX"
  defaults write com.apple.terminal \
    "Startup Window Settings" -string "OSX"
  # Only use UTF-8
  defaults write com.apple.terminal StringEncodings -array 4
fi

########################
## More Optional Apps ##
########################
read -r -p "Install Docker? [y/N] " response
if [[ "$response" =~ $YES ]]
then
  brew install docker
  brew install docker-compose
  # "starter", tool to examine repo and bootstrap Dockerfile
  curl -sSL \
    https://raw.githubusercontent.com/cloud66/starter/master/install.sh \
    | bash
fi

read -r -p "Install AWS Command-line tools? [y/N] " response
if [[ "$response" =~ $YES ]]
then
  brew install awscli
fi

read -r -p "Install Heroku Command-line tools? [y/N] " response
if [[ "$response" =~ $YES ]]
then
  brew tap heroku/brew && brew install heroku
fi

read -r -p "Install Github Command-line tools? [y/N] " response
if [[ "$response" =~ $YES ]]
then
  # Github CLI
  brew install github/gh/gh
fi

read -r -p "Install Microsoft Azure Command-line tools? [y/N] " response
if [[ "$response" =~ $YES ]]
then
  brew install azure-cli
fi

read -r -p "Install Python version management (PyEnv)? [y/N] " response
if [[ "$response" =~ $YES ]]
then
  brew install pyenv
  pyenv install 1.2.12
  pyenv global 1.2.12
  echo 'if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi' \
    >> ~/.zshrc
  source ~/.zshrc
fi

read -r -p "Allow NTFS support? [y/N] " response
if [[ "$response" =~ $YES ]]
then
  # Allow writing to NTFS drives
  # Example: sudo /usr/local/bin/ntfs-3g \
  #               /dev/disk1s1 /Volumes/NTFS -olocal -oallow_other
  # sub /dev/disk1s1 with your disk (find it with diskutil list)
  brew cask install osxfuse
  brew install homebrew/fuse/ntfs-3g
  sudo mkdir /Volumes/NTFS
fi

read -r -p "Install DBeaver for database debugging? [y/N] " response
if [[ "$response" =~ $YES ]]
then
  # dbeaver depends on java
  brew install --cask adoptopenjdk
  brew install --cask dbeaver-community
fi

read -r -p "Install Google’s Flutter mobile framework? [y/N] " response
if [[ "$response" =~ $YES ]]
then
  git clone -b beta https://github.com/flutter/flutter.git
  export PATH=$PWD/flutter/bin:$PATH
  flutter doctor
  flutter doctor --android-licenses
  sudo gem install cocoapods
fi

./systems/OSX/_mpf.sh
