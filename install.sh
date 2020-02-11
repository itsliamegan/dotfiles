#!/bin/sh

# Install the necessary system packages.
./install_system_packages.sh

# Symlink configuration files in each of the subdirectories to the
# home directory.
stow bash
stow emacs
stow git
stow i3
stow xorg
