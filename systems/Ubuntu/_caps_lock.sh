#!/bin/bash

# Makes "Caps Lock" key act as ESC Key.

sudo apt install xbindkeys xvkbd
cp config/.xbindkeysrc ~/
cp config/.xinitrc ~/

killall -s1 xbindkeys && xbindkeys
