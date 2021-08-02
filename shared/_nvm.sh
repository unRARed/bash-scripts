#!/usr/bin/env bash

read -r -p "Install Node Version Manager (nvm)? [y/N] " response
if [[ "$response" =~ $YES ]]
then
  curl -o- \
    https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh \
    | bash
  echo '' >> ~/.zshrc
  echo '# Load Node Version Manager' >> ~/.zshrc
  echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
  echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc
  # the bash completions seems to work with zsh, too
  echo '[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion' >> ~/.zshrc
  source ~/.zshrc
  nvm install 14.3.0
  nvm alias default v14.3.0
fi
