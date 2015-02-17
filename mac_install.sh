sudo xcodebuild -license

xcode-select --install

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor

brew install git

git config --global user.name "Ryan Richardson"
git config --global user.email "ryananthonyrichardson@gmail.com"
git config --global color.ui true
git config --global alias.hist "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global core.editor "subl -n -w"

echo "gem: --no-document" >> ~/.gemrc

curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails

brew install postgresql
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# Assumes prior installation of Sublime Text 3
echo "alias subl=\"/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl\"" >> ~/.bash_profile
