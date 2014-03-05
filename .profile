# ~/.profile

[ -z "$XDG_CONFIG_HOME" ] && export XDG_CONFIG_HOME="$HOME/.config"
[ -z "$XDG_DATA_HOME" ] && export XDG_DATA_HOME="$HOME/.local/share"
[ -z "$XDG_CACHE_HOME" ] && export XDG_CACHE_HOME="$HOME/.cache"

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
