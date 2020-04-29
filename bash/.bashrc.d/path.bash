add_to_path () {
  PATH=$1:$PATH
}

add_to_path /usr/sbin
add_to_path /usr/local/sbin
add_to_path ~/.cask/bin

export PATH
