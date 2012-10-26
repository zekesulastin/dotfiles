# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

. $XDG_CONFIG_HOME/environment

if [[ ! $SSH_TTY ]] && [[ $(fgconsole) == 1 ]]; then
	exec startx 2>/dev/null
fi
