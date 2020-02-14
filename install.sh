#!/bin/sh

# Install the necessary system packages.
./install_system_packages.sh

# Remove any files that might conflict.
rm ~/.bashrc

# Symlink configuration files in each of the subdirectories to the
# home directory.
stow bash
stow emacs
stow git
stow i3
stow ruby
stow xorg
