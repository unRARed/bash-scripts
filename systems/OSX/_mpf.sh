#!/usr/bin/env bash

read -r -p "Install Mission Pinball Framework? [y/N] " response
if [[ "$response" =~ $YES ]]
then
  wget https://mpf.kantert.net/mpf_mac_frameworks.zip
  unzip mpf_mac_frameworks.zip
  sudo mv Frameworks/* /Library/Frameworks/
  rm -Rf Frameworks
  rm -Rf __MACOSX
  rm -Rf ReadMe.txt
  rm -Rf License.txt
  rm -Rf mpf_mac_frameworks.zip
  pip3 install pip setuptools cython==0.24.1 --upgrade
  pip3 install mpf mpf-mc mpf-monitor
fi
