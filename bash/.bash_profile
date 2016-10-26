#!/usr/local/bin/bash
[ -z "$PS1" ] && return

. ~/.bashrc.d/settings
. ~/.bashrc.d/paths
. ~/.bashrc.d/colors
. ~/.bashrc.d/greeting
. ~/.bashrc.d/aliases
. ~/.bashrc.d/prompts/cl1ck
. /etc/bash_completion
for f in ~/.bashrc.d/completions/*; do source $f; done

export NODE_ENV=development
