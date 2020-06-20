#!/usr/bin/env fish

./install_macos_packages.fish
./install_gui_programs.fish
./install_fish_plugins.fish
./install_ruby_gems.fish

function symlink_config_files
  stow emacs
  stow git
  stow fish
  stow ruby
end

symlink_config_files
