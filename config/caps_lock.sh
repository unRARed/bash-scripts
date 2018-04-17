#!/bin/bash

# Makes "Caps Lock" key act as ESC Key.

sudo apt install xbindkeys xvkbd
cp .xbindkeysrc ~/
cp .xinitrc ~/

killall -s1 xbindkeys && xbindkeys
