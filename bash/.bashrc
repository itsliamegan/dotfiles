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
