####################
# GLOBAL VARIABLES #
####################

export NAME="Liam Egan"
export EMAIL="liam@liamegan.com"
export EDITOR=vim
export TERM=xterm-256color

########
# PATH #
########

export PATH=$PATH:~/.cask/bin
export PATH=$PATH:~/.composer/vendor/bin
export PATH=$PATH:~/.fnm
export PATH=$PATH:~/.pub-cache/bin
export PATH=$PATH:vendor/bin

export CDPATH=.:~/:~/Projects

##########
# PROMPT #
##########

export PS1="\u:\[\033[92m\]\W\[\033[000m\] $ \[\033[000m\]"

#########################
# OVERRIDES AND ALIASES #
#########################

alias cd="cd >/dev/null"
alias ls="ls -GF"
alias tree="tree -CF"

alias yt2mp4="youtube-dl --format 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4'"
alias yt2mp3="youtube-dl --extract-audio --audio-format mp3"

####################
# LANGUAGE TOOLING #
####################

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

eval $(fnm env)

###############
# COMPLETIONS #
###############

if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
  . $(brew --prefix)/etc/bash_completion
fi
