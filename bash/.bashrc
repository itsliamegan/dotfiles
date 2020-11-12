# Set some basic variables.
export NAME="Liam Egan"
export EMAIL="liam@liamegan.com"
export EDITOR=vim

# Add useful directories to the PATH.
export PATH=$PATH:~/.cask/bin
export PATH=$PATH:~/.composer/vendor/bin
export PATH=$PATH:~/.fnm
export PATH=$PATH:~/.pub-cache/bin
export PATH=$PATH:vendor/bin

# Add useful directories to the CDPATH.
export CDPATH=.:~/:~/Projects

# Set a pretty prompt.
export PS1="\u:\033[92m\W \033[000m\$ \033[0m"

# Overrides of built-in commands.
alias ls="ls -GF"

# Helpful aliases/functions.
alias yt2mp4="youtube-dl --format 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4'"
alias yt2mp3="youtube-dl --extract-audio --audio-format mp3"

# Use the correct Ruby version from chruby.
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# Use the correct Node version from fnm.
eval $(fnm env)

# Use system completions.
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
