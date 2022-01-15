#!/usr/bin/env bash

read -r -p "Install Ruby Version Manager (rvm)? [y/N] " response
if [[ "$response" =~ $YES ]]
then
  curl -sSL https://rvm.io/mpapis.asc | gpg --import -
  curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
  curl -L https://get.rvm.io | bash -s stable --auto-dotfiles
  echo 'alias rails_reset="RAILS_ENV=development rails db:drop db:create db:migrate db:seed"' >> ~/.zshrc
  source ~/.zshrc
  rvm install 2.7.2 --default
fi
