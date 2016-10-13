#!/usr/local/bin/bash
[ -z "$PS1" ] && return

. ~/.bashrc.d/settings
. ~/.bashrc.d/paths
. ~/.bashrc.d/colors
. ~/.bashrc.d/greeting
. ~/.bashrc.d/aliases
. ~/.bashrc.d/functions
. ~/.bashrc.d/prompt
. ~/.bashrc.d/completion

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
