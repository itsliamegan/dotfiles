#!/bin/sh

./install_macos_packages.sh
./install_ruby_gems.sh

remove_conflicting_files () {
  rm -f ~/.bashrc
}

symlink_config_files () {
  stow emacs
  stow git
  stow fish
  stow ruby
}

remove_conflicting_files
symlink_config_files
