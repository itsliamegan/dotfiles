# Set the prompt to show the current working directory in brackets and
# nothing else.
PS1="${debian_chroot:+($debian_chroot)}\[\033[32m\][\w]\[\033[0m\] $ "

# When starting, cd to the last opened directory. When exiting, store that
# directory in a file to use on the next open.

if [ -f ~/.last-opened-directory ]; then
  cd $(cat ~/.last-opened-directory)
fi

function store-last-opened-directory {
  pwd > ~/.last-opened-directory
}

trap store-last-opened-directory EXIT

# Path modifications.

function addtopath {
  PATH=$1:$PATH
}

addtopath /usr/sbin
addtopath /usr/local/sbin

export PATH

# Environment variables.

export EDITOR=vim

# Aliases.

alias yt2mp4="youtube-dl --format 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4'"
alias yt2mp3="youtube-dl --extract-audio --audio-format mp3"

# Disable C-s and others from stopping/resuming program output
stty sane
stty stop ""
stty start ""
stty werase ""

# Setup chruby to change ruby versions.
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
