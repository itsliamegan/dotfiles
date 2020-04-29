#!/bin/sh

./install_debian_packages.sh
./install_ruby_gems.sh

remove_conflicting_files () {
  rm -f ~/.bashrc
}

symlink_config_files () {
  stow bash
  stow emacs
  stow git
  stow i3
  stow redshift
  stow ruby
  stow vim
  stow xorg
}

remove_conflicting_files
symlink_config_files
