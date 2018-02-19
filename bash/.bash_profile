#!/usr/local/bin/bash
[ -z "$PS1" ] && return

. ~/.bashrc.d/settings
. ~/.bashrc.d/colors
. ~/.bashrc.d/greeting
. ~/.bashrc.d/aliases
. ~/.bashrc.d/ssh

# active prompt
. ~/.bashrc.d/prompts/cl1ck
# . ~/.bashrc.d/prompts/ohmygit

# bash completion
. /etc/bash_completion
for f in ~/.bashrc.d/completions/*; do source $f; done

# tools
for f in ~/.bashrc.d/tools/*; do source $f; done

export NODE_ENV=development
