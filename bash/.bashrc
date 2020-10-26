# Set some basic variables.
export NAME="Liam Egan"
export EMAIL="liam@liamegan.com"
export EDITOR=emacs

# Add useful directories to the PATH.
export PATH=$PATH:~/.cask/bin
export PATH=$PATH:~/.composer/vendor/bin
export PATH=$PATH:~/.fnm
export PATH=$PATH:vendor/bin

# Add useful directories to the CDPATH.
export CDPATH=.:~/:~/Projects

# Set a pretty prompt.
export PS1="\u:\033[92m\W \033[037m\$ \033[0m"

# Use the correct Ruby version from chruby.
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# Use the correct Node version from fnm.
eval $(fnm env)

# Use system completions.
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
