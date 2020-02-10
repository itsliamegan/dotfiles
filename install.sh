#!/bin/sh

# Install the necessary system packages.
./install_system_packages.sh

# Symlink configuration files in each of the folders to the home
# directory.
stow bash
stow emacs
stow git
stow xorg
