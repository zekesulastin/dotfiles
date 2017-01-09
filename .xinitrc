#!/bin/sh

#.xinitrc! X server settings!

_xinithost="$(hostname)" #TIL $HOSTNAME is a bashism

if [ "$_xinithost" = "tsukikage" ]; then
	nvidia-settings -l
fi

compton -b --config="$XDG_CONFIG_HOME/compton.conf"
xset fp+ /home/zekesulastin/.fonts
xset fp rehash
xset b off &
xrdb -merge "$XDG_CONFIG_HOME/Xresources"
xrandr --dpi 96 &
setxkbmap -option caps:escape &

start-pulseaudio-x11

mkdir "$XDG_RUNTIME_DIR/mpv"
mkfifo "$XDG_RUNTIME_DIR/mpv/input"

paplay --property=media.role=event "$XDG_CONFIG_HOME/pulse/Windows 98 Startup.wav" &
ponymix get-volume > "$XDG_RUNTIME_DIR/pulse/pvu" #cannot be backgrounded or conky chokes

exec i3
