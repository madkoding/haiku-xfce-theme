#!/bin/bash
# apply-resolution.sh — aplica resolucion virtual 1366x800 en panel 1024x600
export DISPLAY=:0.0
export XAUTHORITY="$HOME/.Xauthority"
sleep 2
xrandr --fb 1366x800
xrandr --output LVDS1 --mode 1024x600 --scale 1.3333x1.3333 --pos 0x0
xrandr --dpi 72
xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "DMZ-White" 2>/dev/null || true
xfconf-query -c xsettings -p /Gtk/CursorThemeSize -s 10 2>/dev/null || true
