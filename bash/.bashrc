# Path modifications.

addtopath () {
  PATH=$1:$PATH
}

addtopath /usr/sbin
addtopath /usr/local/sbin

export PATH
