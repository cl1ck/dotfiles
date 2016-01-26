source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundles <<EOBUNDLES
  # Basics
  sudo
  command-not-found
  jimmijj/zsh-syntax-highlighting
  tarruda/zsh-autosuggestions
  zsh-users/zsh-history-substring-search
  unixorn/autoupdate-antigen.zshplugin

  # Navigation
  autojump

  # Git and github autocompletions and aliases
  git
  git-extras
  bobthecow/git-flow-completion

  # Tools
  gem
  composer
  bundler
  brew

  # Completions
  node
  npm
  nvm
  phing
  pip
  rvm
  vagrant

  # Additional features
  ascii-soup/zsh-url-highlighter

  # Webdev
  walesmd/caniuse.plugin.zsh
EOBUNDLES

# Load the theme.
antigen theme desyncr/zshrc themes/af-magic-mod

# exports
export EDITOR=vim
export open=chrome
export LANG=en_US.utf8
export LC_ALL=en_US.utf8

# Tell antigen that you're done.
antigen apply
