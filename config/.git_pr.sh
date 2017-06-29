##!/usr/bin/env bash
# Credit Josh Buker (athix@Github)

git_pr() {
  if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] ; then
    echo "Missing required arguments:"
    echo "1 - origin/upstream (remote where PR exists, not the fork)"
    echo "2 - pull request ID (e.g. '42' without quotation)"
    echo "3 - local branch to fetch onto (must not already exist)"
  else
    if git fetch $1 pull/$2/head:$3 ; then
      git checkout $3
    else
      echo "Failed to fetch pull request $2"
    fi
  fi
}
