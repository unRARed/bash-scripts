# OSX pre-reqs
sudo xcodebuild -license
xcode-select --install

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Git and bash/git completion
brew install git bash-completion # Note, the OSX pre-installed Git will not work with bash-completion
git config --global user.name "Ryan Richardson"
git config --global user.email "ryananthonyrichardson@gmail.com"
git config --global color.ui true
git config --global alias.hist "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global core.editor "subl -n -w"
echo -e "if [ -f `brew --prefix`/etc/bash_completion ]; then\n    . `brew --prefix`/etc/bash_completion\nfi" >> ~/.bash_profile

# git-aware bash prompt
brew install bash-git-prompt
echo -e "if [ -f \"$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh\" ]; then\n    source \"$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh\"\nfi" >> ~/.bash_profile


# Ruby on Rails
echo "gem: --no-document" >> ~/.gemrc
curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails

# Node Version Manager
curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash
source ~/.bashrc
nvm install 0.12.7
nvm alias default v0.12.7

# Postrgresql Database (for Rails on Heroku)
brew install postgresql
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# Assumes prior installation of Sublime Text 3
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

source ~/.bash_profile
