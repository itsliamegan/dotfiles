#!/usr/bin/env sh

# Install system programs.
brew install \
  bash \
  chruby \
  composer \
  curl \
  git \
  htop \
  nvm \
  php \
  postgresql \
  ripgrep \
  ruby-install \
  sqlite \
  stow \
  wget \
  yarn

# Install GUI programs.
brew cask install \
  dash \
  dropbox \
  emacs \
  google-chrome \
  iterm2 \
  karabiner-elements \
  notion \
  scroll-reverser \
  spotify \
  table-plus \
  1password

# Install Ruby gems.
gem install \
  flay \
  flog \
  pry \
  reek

# Symlink config files.
stow emacs
stow git
stow bash
stow ruby
