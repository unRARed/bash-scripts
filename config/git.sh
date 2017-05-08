##!/usr/bin/env bash

git config --global color.ui true
git config --global merge.ff false
git config --global pull.ff only
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.prune remote prune origin
git config --global alias.nuke push origin --delete
git config --global alias.hist "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
