source ./antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundles <<EOBUNDLES
  # Basics
  sudo
  command-not-found
  colored-man
  jimmijj/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
  tarruda/zsh-autosuggestions

  # Navigation
  autojump

  # Git and github autocompletions and aliases
  git
  git-extras
  bobthecow/git-flow-completion

  # Tools of the trade
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

EOBUNDLES

# Load the theme.
antigen theme desyncr/zshrc themes/af-magic-mod

# exports
export EDITOR=vim
export open=chrome

# Tell antigen that you're done.
antigen apply
