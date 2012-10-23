# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

. $XDG_CONFIG_HOME/environment

if [[ $HOSTNAME != hoshiakari ]] && [[ $(fgconsole) == 1 ]]; then
	exec startx -- vt1 2>/dev/null
fi
