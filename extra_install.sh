#!/bin/bash

# Spotify
sudo echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
sudo apt-get update && sudo apt-get install spotify-client

# XBMC
sudo apt-get install python-software-properties pkg-config
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:team-xbmc/unstable
sudo apt-get update
sudo apt-get install xbmc