# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

. $XDG_CONFIG_HOME/environment

if [[ $(fgconsole 2>/dev/null) == 1 ]]; then
	exec startx &>/dev/null
fi
