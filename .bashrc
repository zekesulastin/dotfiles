#!/bin/bash
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

for file in "$XDG_CONFIG_HOME"/bash/*; do
	. "$file"
done
. /usr/share/bash-completion/bash_completion

HISTCONTROL=ignoredups:ignorespace
