#!/bin/zsh
ANTIGEN=$HOME/.antigen/

autoload -U colors && colors
export TERM="xterm-256color"

# Antigen
if [ ! -f $ANTIGEN/antigen.zsh ]; then
  git clone https://github.com/zsh-users/antigen.git $ANTIGEN
fi

if [ -f $ANTIGEN/antigen.zsh ]; then
  source $ANTIGEN/antigen.zsh
  antigen use oh-my-zsh

  antigen bundle unixorn/autoupdate-antigen.zshplugin

  if [[ `uname` == 'Darwin' ]]; then
    antigen bundle osx
    antigen bundle brew
  fi

  zstyle :omz:plugins:ssh-agent agent-forwarding on

  antigen bundles <<EOBUNDLES
    autojump
    cp
    dircycle
    gnu-utils
    history
    history-substring-search
    dirpersist
    sudo
    profiles
    command-not-found
    common-aliases

    ssh-agent

    git
    git-extras
    git-flow
    github
    vagrant
    ruby
    rbenv
    bundler
    gem
    virtualenv
    pip
    compose
    node
    nvm

    ascii-soup/zsh-url-highlighter
    Tarrasch/zsh-autoenv
    zsh-users/zsh-syntax-highlighting
    tarruda/zsh-autosuggestions
    zsh-users/zsh-completions
    zsh-users/zsh-history-substring-search
EOBUNDLES

  # theme
  antigen theme desyncr/zshrc themes/af-magic-mod

  # nvm settings
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

  antigen apply
  unalias rm

  # keymaps
  if [[ `uname` == 'Darwin' ]]; then
    zmodload zsh/terminfo
    bindkey "$terminfo[cuu1]" history-substring-search-up
    bindkey "$terminfo[cud1]" history-substring-search-down
  else
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
  fi

fi

# exports
export EDITOR=vim
export open=chrome
export LANG=en_US.utf8
export LC_ALL=en_US.utf8

eval "$(rbenv init -)"
