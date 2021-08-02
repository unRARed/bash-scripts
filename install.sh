#!/usr/bin/env bash
export YES='^([yY][eE][sS]|[yY])+$'

SYSTEM=$(uname -a)
if [[ $SYSTEM =~ "Darwin" ]]; then
  echo "Mac OSX detected"
  ./systems/OSX/main.sh
elif [[ $SYSTEM =~ "Ubuntu" ]]; then
  echo "Ubuntu Linux detected"
  ./systems/Ubuntu/main.sh
else
  echo "OS not supported."
fi
