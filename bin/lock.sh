\#!/usr/bin/env bash

#icon="$HOME/.config/i3/nrVexob.png"
tmpbg='/tmp/screen.png'

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
#convert "$tmpbg"  -gravity center -composite -matte "$tmpbg"
i3lock  -i "$tmpbg"

sleep 120

pgrep i3lock && xset dpms force off
