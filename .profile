# ~/.profile

[ -z "$XDG_CONFIG_HOME" ] && export XDG_CONFIG_HOME="$HOME/.config"
[ -z "$XDG_DATA_HOME" ] && export XDG_DATA_HOME="$HOME/.local/share"
[ -z "$XDG_CACHE_HOME" ] && export XDG_CACHE_HOME="$HOME/.cache"

if [ -z "$TMUX" ]; then
	case "$TERM" in
		rxvt* | xterm-termite )
			rm "$XDG_RUNTIME_DIR/androidterm" 2>/dev/null ;;
		* )
			touch "$XDG_RUNTIME_DIR/androidterm" ;;
	esac
fi

for profile in $XDG_CONFIG_HOME/profile.d/*; do
	. "$profile"
done
unset profile

[ -f ~/.bashrc ] && . ~/.bashrc

if [ "$(fgconsole 2>/dev/null)" = "1" ]; then
	eval $(ssh-agent -s)
	ssh-add
	exec startx &>/dev/null
fi
