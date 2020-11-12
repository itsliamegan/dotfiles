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
  amethyst \
  dash \
  figma \
  google-chrome \
  iterm2 \
  karabiner-elements \
  scroll-reverser \
  spotify \
  1password

# Install Ruby gems.
gem install \
  flay \
  flog \
  pry \
  reek \
  standard

# Symlink config files.
stow bash
stow git
stow node
stow ruby
stow vim
