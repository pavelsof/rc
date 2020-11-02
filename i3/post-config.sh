#!/bin/bash

# screen resolution
xrandr --output eDP-1 --mode 1600x900

# load the colours
xrdb -load .Xresources

# азбуки
setxkbmap -layout us,bg -variant altgr-intl,phonetic -option grp:caps_toggle

# redden the screen
redshift -P -O 4500
