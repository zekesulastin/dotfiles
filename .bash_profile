# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ $(fgconsole) = 1 ]] && exec startx -- vt1
