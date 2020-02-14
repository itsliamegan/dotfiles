# Path modifications.

addtopath () {
  PATH=$1:$PATH
}

addtopath /usr/sbin
addtopath /usr/local/sbin

export PATH

# Setup chruby to change ruby versions.
source /usr/local/bin/chruby.sh
source /usr/local/bin/auto.sh
