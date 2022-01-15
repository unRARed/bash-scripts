#!/usr/bin/env bash

while [ -z "$GIT_EMAIL" ]
do
  read -p "Git Email: " email
  case $email in
    *[@]* ) GIT_EMAIL=$email;;
    * ) echo "Please enter a valid email address.";;
  esac
done
read -p "Git User Name: " GIT_USER_NAME

git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_USER_NAME
git config --global color.branch auto
git config --global color.diff auto
git config --global color.grep auto
git config --global color.interactive auto
git config --global color.showbranch auto
git config --global color.status auto
git config --global color.ui auto
git config --global merge.ff false
git config --global pull.ff only
git config --global tag.sort "-taggerdate"
git lfs install --system

read -r -p "Install command-line aliases for git? [y/N] " response
if [[ "$response" =~ $YES ]]
then
  git config --global alias.co checkout
  git config --global alias.br branch
  git config --global alias.ci commit
  git config --global alias.st status
  git config --global alias.prune "remote prune origin"
  git config --global alias.nuke "push origin --delete"
  git config --global alias.groom \
    "!git branch --merged | grep  -v '\\*\\|master\\|production' | xargs -n 1 git branch -d"
  git config --global alias.lg \
    "log --graph --abbrev-commit --date=relative --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
fi
