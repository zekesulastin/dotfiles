# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ $(fgconsole) = 1 ]] && [[ `cat /etc/hostname` != hoshiakari ]]; then
	exec startx -- vt1
fi
