#!/bin/bash
# apply-wallpaper.sh — aplica el fondo Haiku por defecto
export DISPLAY=:0.0
export XAUTHORITY="$HOME/.Xauthority"
WALL="$HOME/.config/wallpapers/haiku-default.png"
[ -f "$WALL" ] || WALL="$HOME/.themes/Haiku/wallpapers/haiku-default.png"

for KEY in \
  /backdrop/screen0/monitor0/workspace0/last-image \
  /backdrop/screen0/monitor0/image-path \
  /backdrop/screen0/monitor0/last-image \
  /backdrop/screen0/monitor0/last-single-image \
  /backdrop/screen0/monitor0/workspace0/image-path
  do
    xfconf-query -c xfce4-desktop -p "$KEY" -n -t string -s "$WALL" 2>/dev/null || \
    xfconf-query -c xfce4-desktop -p "$KEY" -s "$WALL" 2>/dev/null || true
  done
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/image-style -n -t int -s 5 2>/dev/null || \
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/image-style -s 5 2>/dev/null || true
xfdesktop --reload 2>/dev/null || true
