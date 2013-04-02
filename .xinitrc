#!/bin/sh

#.xinitrc! X server settings!

_xinithost="$(hostname)" #TIL $HOSTNAME is a bashism

if [ "$_xinithost" = "tsukikage" ]; then
	sudo systemctl start asd.service &
	nvidia-settings -l
fi

xset fp+ /home/zekesulastin/.fonts
xset fp rehash
xset b off &
xrdb -merge "$XDG_CONFIG_HOME/Xresources"
xrandr --dpi 96 &
nitrogen --restore &

if [  "$_xinithost" = "meiousei" ]; then
	urxvtd -q -o -f &
	start-pulseaudio-x11 -n --file="$XDG_CONFIG_HOME/pulse/meiousei.pa"
else
	start-pulseaudio-x11
fi

paplay --property=media.role=event "$XDG_CONFIG_HOME/pulse/Windows 98 Startup.wav" &
ponymix get-volume > /tmp/pvu.zekesulastin #cannot be backgrounded or conky chokes
exec dbus-launch i3
