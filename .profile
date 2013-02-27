# ~/.profile

[ -z "$XDG_CONFIG_HOME" ] && XDG_CONFIG_HOME="$HOME/.config"
[ -z "$XDG_DATA_HOME" ] && XDG_DATA_HOME="$HOME/.local/share"
[ -z "$XDG_CACHE_HOME" ] && XDG_CACHE_HOME="$HOME/.cache"

[ -f ~/.bashrc ] && . ~/.bashrc
. $XDG_CONFIG_HOME/environment

if [ "$(fgconsole 2>/dev/null)" = "1" ]; then
	exec startx &>/dev/null
fi
