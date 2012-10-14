# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

. $XDG_CONFIG_HOME/environment

if [[ $(fgconsole) = 1 ]] && [[ $HOSTNAME != hoshiakari ]]; then
	exec startx -- vt1
fi
