function addtopath {
  PATH=$1:$PATH
}

addtopath /usr/sbin
addtopath /usr/local/sbin
addtopath ~/.cask/bin

export PATH
