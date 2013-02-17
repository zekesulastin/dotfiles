#!/bin/bash
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. $XDG_CONFIG_HOME/bash/alias
. $XDG_CONFIG_HOME/bash/udisks
. $XDG_CONFIG_HOME/bash/pl
. $XDG_CONFIG_HOME/bash/systemd-alias
. $XDG_CONFIG_HOME/bash/git-prompt
. $XDG_CONFIG_HOME/bash/infinality-settings
. $XDG_CONFIG_HOME/bash/prompt
. $XDG_CONFIG_HOME/bash/console-colors

HISTCONTROL=ignoredups:ignorespace
