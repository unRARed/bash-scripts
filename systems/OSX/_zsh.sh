#!/usr/bin/env bash

echo 'compinit' | cat - ~/.zshrc > temp && mv temp ~/.zshrc
echo 'autoload -U compinit' | cat - ~/.zshrc > temp && mv temp ~/.zshrc
echo 'fpath=(/usr/local/share/zsh-completions $fpath)' | cat - ~/.zshrc \
  > temp && mv temp ~/.zshrc
echo '# Load zsh completions' | cat - ~/.zshrc > temp && mv temp ~/.zshrc
# should already be default, but maybe you upgraded...?
chsh -s /bin/zsh
# fix compaudit directory perms
compaudit | xargs chmod g-w
