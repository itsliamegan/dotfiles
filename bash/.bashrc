# Set the prompt to show the current working directory in brackets and
# nothing else.
PS1="${debian_chroot:+($debian_chroot)}\[\033[32m\][\w]\[\033[0m\]: "

# Path modifications.

addtopath () {
  PATH=$1:$PATH
}

addtopath /usr/sbin
addtopath /usr/local/sbin

export PATH

# Setup chruby to change ruby versions.
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
