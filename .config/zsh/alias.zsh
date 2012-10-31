#!/usr/bin/env bash

alias less=$PAGER
alias zless=$PAGER 
alias ls='ls --color=auto'
alias du1='du -h --max-depth=1'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias mpc='mpc -h '${MPD_HOST}
alias msi='makepkg -si'
alias syua='sudo pacman-color -Syu && meat -u'
alias syu='sudo pacman-color -Syu'
alias auau='sudo aptitude update && sudo aptitude upgrade'
alias winej='LC_ALL=ja_JP wine'
alias xrl='xrandr --output DVI-D-0 --rotate left'
alias xrn='xrandr --output DVI-D-0 --rotate normal'
alias ix="curl -sF 'f:1=<-' http://ix.io"
alias fluidstart="(nohup fluidsynth -is -a pulseaudio -r 44100 soundfont-unison /usr/share/soundfonts/Unison.sf2 >/dev/null 2>&1 &)"
alias fluidstop="pkill fluidsynth"
alias midiplay="aplaymidi --port 128:0"
alias mpt="mplayer -ao pulse:tsukikage"
alias mpm="mplayer -ao pulse:meiousei"
alias mpo="mplayer -ao pulse:okaasan"
alias powerdown="pkill firefox; sudo systemctl stop asd.service && poweroff" ;

if [[ $HOSTNAME != hoshiakari ]]; then
	alias ncmpcpp="ssh hoshiakari -t 'LC_ALL=en_US.UTF-8 ncmpcpp' 2>/dev/null" ;
fi

