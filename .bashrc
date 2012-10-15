#!/bin/bash
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. $XDG_CONFIG_HOME/bash/alias
. $XDG_CONFIG_HOME/bash/udisks
. $XDG_CONFIG_HOME/bash/systemd_alias
. $XDG_CONFIG_HOME/bash/git-prompt
. $XDG_CONFIG_HOME/bash/infinality-settings
. $XDG_CONFIG_HOME/bash/prompt

HISTCONTROL=ignoredups:ignorespace


