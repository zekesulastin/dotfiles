#!/bin/sh

#.xinitrc! X server settings!

if [[ `cat /etc/hostname` == tsukiakari ]]; then
	nvidia-settings -l &
fi

xset +fp /usr/share/fonts/local &
xset +fp /home/zekesulastin/.fonts &
xset fp rehash &
xset b off &
xrandr --dpi 96 &
nitrogen --restore &
start-pulseaudio-x11 &
paplay --property=media.role=event "/home/zekesulastin/.pulse/Windows 98 Startup.wav" &
ponymix get-volume > /tmp/pvu.zekesulastin #cannot be backgrounded or conky chokes
exec dbus-launch i3
