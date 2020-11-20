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
  wget \
  yarn

# Install GUI programs.
brew cask install \
  amethyst \
  dash \
  figma \
  gitup \
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
paths=(
  ".bashrc"
  ".bundle"
  ".gitconfig"
  ".gitignore"
  ".node-version"
  ".ruby-version"
  ".tmux.conf"
  ".vimrc"
)
for path in ${paths[@]}; do
  local_path="$PWD/$path"
  home_path="$HOME/$path"

  if ! [[ -f $local_path || -d $local_path ]]; then
    echo "$local_path does not exist"
    continue
  fi

  if [[ -f $home_path || -d $home_path ]]; then
    echo "$home_path already exists"
    continue
  fi

  ln -s $local_path $home_path
done
