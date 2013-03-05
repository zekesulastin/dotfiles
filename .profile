# ~/.profile

[ -z "$XDG_CONFIG_HOME" ] && export XDG_CONFIG_HOME="$HOME/.config"
[ -z "$XDG_DATA_HOME" ] && export XDG_DATA_HOME="$HOME/.local/share"
[ -z "$XDG_CACHE_HOME" ] && export XDG_CACHE_HOME="$HOME/.cache"

. $XDG_CONFIG_HOME/environment
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
	if [ ! "$(hostname)" = "hoshiakari" ]; then
		eval $(ssh-agent -s)
		ssh-add
	fi
fi

if [ "$(fgconsole 2>/dev/null)" = "1" ]; then
	exec startx &>/dev/null
fi
