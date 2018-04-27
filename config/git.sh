#!/bin/bash

git config --global color.branch auto
git config --global color.diff auto
git config --global color.grep auto
git config --global color.interactive auto
git config --global color.showbranch auto
git config --global color.status auto
git config --global color.ui auto
git config --global merge.ff false
git config --global pull.ff only
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.prune "remote prune origin"
git config --global alias.nuke "push origin --delete"
# :groom -> Removes all local branches that have been fully merged
git config --global alias.groom "branch --merged master | grep -v 'master$' | xargs git branch -d"
git config --global alias.lg "log --graph --abbrev-commit --date=relative --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
cp config/.git_pr.sh ~/
echo 'source ~/.git_pr.sh' >> ~/.bashrc
source ~/.git_pr.sh
