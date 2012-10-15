#!/bin/sh

#.xinitrc! X server settings!

if [[ $HOSTNAME == tsukiakari ]]; then
	nvidia-settings -l &
elif [[ $HOSTNAME == meiousei ]]; then
	urxvtd -q -o -f &
fi

xset fp+ /usr/share/fonts/local,/home/zekesulastin/.fonts &
xset fp rehash &
xset b off &
xrdb -merge ~/.Xresources
xrandr --dpi 96 &
nitrogen --restore &
start-pulseaudio-x11 &
paplay --property=media.role=event "/home/zekesulastin/.pulse/Windows 98 Startup.wav" &
ponymix get-volume > /tmp/pvu.zekesulastin #cannot be backgrounded or conky chokes
exec dbus-launch i3
