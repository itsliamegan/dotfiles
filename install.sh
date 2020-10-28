#!/usr/bin/env sh

# Install system programs.
brew install \
  bash \
  chruby \
  composer \
  curl \
  fd \
  fnm \
  git \
  php \
  postgresql \
  ripgrep \
  ruby-install \
  sd \
  sqlite \
  stow \
  wget \
  yarn

# Install GUI programs.
brew cask install \
  dash \
  emacs \
  karabiner-elements \
  scroll-reverser \
  spotify \
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
