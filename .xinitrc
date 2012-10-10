#!/bin/sh

xset +fp /usr/share/fonts/local
xset +fp /home/zekesulastin/.fonts
xset fp rehash
xset b off
xrandr --dpi 96 #Thing likes detecting the dpi of my laptop monitor.  No.
nitrogen --restore #bloatier than feh but so ~easy~!
nvidia-settings -l
start-pulseaudio-x11 &
paplay --property=media.role=event "/home/zekesulastin/.pulse/Windows 98 Startup.wav" &
ponymix get-volume > /tmp/pvu.zekesulastin 
exec dbus-launch i3
