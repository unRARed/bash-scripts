# OSX pre-reqs
sudo xcodebuild -license accept
xcode-select --install

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Git and bash/git completion
brew install git bash-completion # Note, the OSX pre-installed Git will not work with bash-completion
git config --global user.name "Ryan Richardson"
git config --global user.email "ryananthonyrichardson@gmail.com"
source config/git.sh
echo -e "if [ -f `brew --prefix`/etc/bash_completion ]; then\n    . `brew --prefix`/etc/bash_completion\nfi" >> ~/.bash_profile

# git-aware bash prompt
brew install bash-git-prompt
echo -e "if [ -f \"$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh\" ]; then\n    source \"$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh\"\nfi" >> ~/.bash_profile

# Allow writing to NTFS drives
# Example: sudo /usr/local/bin/ntfs-3g /dev/disk1s1 /Volumes/NTFS -olocal -oallow_other
# sub /dev/disk1s1 with your disk (find it with diskutil list)
brew cask install osxfuse
brew install homebrew/fuse/ntfs-3g
sudo mkdir /Volumes/NTFS

# Ruby
echo "gem: --no-document" >> ~/.gemrc
curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
rvm install 2.3.3
rvm use 2.3.3 --default
gem install bundler

# Node Version Manager
curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash
source ~/.bashrc
nvm install 7.3.0
nvm alias default v7.3.0

# Postrgresql Database (for Rails on Heroku)
brew install postgresql
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# Sublime Text 3
brew install caskroom/cask/brew-cask
brew tap caskroom/versions
brew cask install sublime-text

# JAVA and Android tools (basically, for adb)
brew cask install java7
brew cask install android-platform-tools

source ~/.bash_profile
